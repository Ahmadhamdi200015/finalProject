import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../function/checkinternet.dart';
import '../function/staterequest.dart';

class Crud {


  Future<Either<StatusRequest, List<dynamic>>> dataGet(String linkUrl, Map<String, dynamic> data) async {
    if (await CheckInternet()) {
      try {
        // إضافة المعلمات إلى الرابط إذا كانت موجودة
        Uri uri = Uri.parse(linkUrl).replace(queryParameters: data);
       String? token=await getToken();

        // إرسال الطلب
        final response = await http.get(
          uri,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        );

        print('Response status code: ${response.statusCode}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          print('Request succeeded.');
          var responseBody = jsonDecode(response.body);

          if (responseBody is List) {
            print('Response is a List: $responseBody');
            return Right(responseBody);
          } else {
            print('Unexpected response type: ${responseBody.runtimeType}');
            return const Left(StatusRequest.serverfailure);
          }
        } else {
          print('Request failed with status: ${response.statusCode}');
          Map<String, dynamic> errorResponse = jsonDecode(response.body);
          print("Error Response: $errorResponse");
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


  Future<Either<StatusRequest, Map>> dataPost(String linkUrl, Map data) async {
    if (await CheckInternet()) {
      try {
        print('trycrud');
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
          print('================error is status');
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
