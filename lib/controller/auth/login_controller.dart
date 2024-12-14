import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';

class LoginController extends GetxController {

  TextEditingController? textEmail;
  TextEditingController? textPassword;
  GlobalKey<FormState> formStateLogin=GlobalKey();

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
    Get.toNamed(AppRoute.forgetPasswordPage);
  }
  goToSignUp() {
    Get.toNamed(AppRoute.signPage);
  }
}
