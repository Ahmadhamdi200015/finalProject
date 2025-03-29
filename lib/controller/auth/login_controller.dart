import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/core/function/staterequest.dart';
import 'package:gazaStore/core/services/service.dart';

import '../../data/datasource/remote/auth/login_data.dart';

class LoginController extends GetxController {

  TextEditingController? textEmail;
  TextEditingController? textPassword;
  GlobalKey<FormState> formStateLogin=GlobalKey();
  StatusRequest statusRequest=StatusRequest.none;
  LoginData loginData=LoginData(Get.find());
  List user=[];
  MyService myService=Get.find();
  String? token;


  Login() async {
    if (formStateLogin.currentState!.validate()) {
      try {
       statusRequest=StatusRequest.lodaing;
       update();

        // استدعاء الدالة postData
        var response = await loginData.postData(
          textEmail!.text.toString(),
          textPassword!.text.toString(),
        );

        if (response is Map && response.containsKey('token')) {
          print('Login success: ${response['token']}');


          myService.sharedPrefrences.setString('userName', response['user']['name']);
          myService.sharedPrefrences.setString('userId', response['user']['id'].toString());
          myService.sharedPrefrences.setString('userEmail', response['user']['email']);

          Get.snackbar('Success', 'Login Successful');
          Get.offAllNamed(AppRoute.homeScreen);
        } else {
          statusRequest=StatusRequest.serverfailure;
          update();
          print('Login failed: $response');
          Get.defaultDialog(
            title: "Login Error",
            middleText: response.toString(),
          );
        }

      } catch (e) {
        statusRequest=StatusRequest.serverfailure;
        update();
        print('Exception: $e');
        Get.defaultDialog(
          title: "Error",
          middleText: "An unexpected error occurred.",
        );
      }

      update();
    }
  }


  @override
  void onInit() {
    textEmail=TextEditingController();
    textPassword=TextEditingController();

    super.onInit();
  }

  goToHomePage(){
    if(formStateLogin.currentState!.validate()){
      Get.offAllNamed(AppRoute.homeScreen);
    }
  }
  goToForgetPage(){
    if(textEmail!.text.isEmpty){
      Get.snackbar('warning', 'Firstly write your Email');
    }else{
      Get.toNamed(AppRoute.forgetPasswordPage,arguments: {
        'email':textEmail!.text
      });

    }
  }
  void goToSignUp() {
    Get.delete<LoginController>(); // حذف الكونترولر من الذاكرة
    Get.offAllNamed(AppRoute.signPage);
  }

}
