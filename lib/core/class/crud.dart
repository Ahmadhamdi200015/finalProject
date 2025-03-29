import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../function/checkinternet.dart';
import '../function/staterequest.dart';

class Crud {


  Future<Either<StatusRequest, Map>> dataPost(String linkUrl, Map data) async {
    if (await CheckInternet()) {
      try {
        // إضافة الهيدر لدعم JSON
        final response = await http.post(
          Uri.parse(linkUrl),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer ${await getToken()}"
          },
          body: jsonEncode(data), // تحويل البيانات إلى JSON
        );
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          print('===================status is status');
          // فك JSON للحصول على الاستجابة
          Map<String, dynamic> responseBody = jsonDecode(response.body);

          // إذا كان يحتوي على توكن، خزنه
          if (responseBody.containsKey("token")) {
            await saveToken(responseBody["token"]);
          }

          print(responseBody); // طباعة الاستجابة للتصحيح
          return Right(responseBody);
        } else {
          // معالجة الأخطاء بناءً على محتوى الاستجابة
          Map<String, dynamic> errorResponse = jsonDecode(response.body);
          print("Error Response: $errorResponse");
          return const Left(StatusRequest.serverfailure);
        }
      } catch (e) {
        print("Exception: $e");
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }


  Future<Either<StatusRequest, dynamic>> dataGet(String linkUrl, Map<String, dynamic> data) async {
    if (await CheckInternet()) {
      try {
        // إضافة المعلمات إلى الرابط
        Uri uri = Uri.parse(linkUrl).replace(queryParameters: data);
        String? token = await getToken();

        if (token == null) {
          print("Error: Token is null");
          return const Left(StatusRequest.authfailure);
        }

        // إرسال الطلب مع timeout
        final response = await http
            .get(
          uri,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        )
            .timeout(const Duration(seconds: 10)); // إضافة مهلة زمنية

        print('Response status code: ${response.statusCode}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          print('Request succeeded.');
          print("Response Body: ${response.body}");

          try {
            var responseBody = jsonDecode(response.body);

            // التحقق مما إذا كانت الاستجابة List أو Map
            if (responseBody is List || responseBody is Map<String, dynamic>) {
              print('Response is a valid JSON structure: $responseBody');
              return Right(responseBody);
            } else {
              print('Unexpected response type: ${responseBody.runtimeType}');
              return const Left(StatusRequest.serverfailure);
            }
          } catch (e) {
            print("JSON Decode Exception: $e");
            return const Left(StatusRequest.parsingfailure);
          }
        } else {
          print('Request failed with status: ${response.statusCode}');
          return const Left(StatusRequest.serverfailure);
        }
      } catch (e) {
        print("Exception occurred: $e");
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      print("No internet connection.");
      return const Left(StatusRequest.offlinefailure);
    }
  }



  Future<Either<StatusRequest, Map>> updateData(String linkUrl, Map data) async {
    if (await CheckInternet()) {
      try {
        // إضافة الهيدر لدعم JSON
        final response = await http.put(
          Uri.parse(linkUrl),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer ${await getToken()}"
          },
          body: jsonEncode(data), // تحويل البيانات إلى JSON
        );
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          // فك JSON للحصول على الاستجابة
          Map<String, dynamic> responseBody = jsonDecode(response.body);

          // إذا كان يحتوي على توكن، خزنه
          if (responseBody.containsKey("token")) {
            await saveToken(responseBody["token"]);
          }

          print(responseBody); // طباعة الاستجابة للتصحيح
          return Right(responseBody);
        } else {
          // معالجة الأخطاء بناءً على محتوى الاستجابة
          Map<String, dynamic> errorResponse = jsonDecode(response.body);
          print("Error Response: $errorResponse");
          return const Left(StatusRequest.serverfailure);
        }
      } catch (e) {
        print("Exception: $e");
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }


  Future<Either<StatusRequest, Map>> deleteData(String linkUrl, Map data) async {
    if (await CheckInternet()) {
      try {
        final response = await http.delete(
          Uri.parse(linkUrl),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer ${await getToken()}"
          },
          body: jsonEncode(data),
        );

        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.body.isNotEmpty) {
            Map<String, dynamic> responseBody = jsonDecode(response.body);

            if (responseBody.containsKey("token")) {
              await saveToken(responseBody["token"]);
            }

            print(responseBody);
            return Right(responseBody);
          } else {
            print("Response body is empty");
            return const Left(StatusRequest.serverfailure);
          }
        } else if (response.statusCode == 204) {
          print('Address deleted successfully.');
          return Right({}); // إرجاع خريطة فارغة بدلاً من محاولة تحليل JSON
        } else {
          if (response.body.isNotEmpty) {
            Map<String, dynamic> errorResponse = jsonDecode(response.body);
            print("Error Response: $errorResponse");
          } else {
            print("Error Response is empty.");
          }
          return const Left(StatusRequest.serverfailure);
        }
      } catch (e) {
        print("Exception: $e");
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }



  // تخزين التوكن باستخدام SharedPreferences
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print("Token saved: $token");
  }

  // استرجاع التوكن
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
