import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';

class SignUpController extends GetxController{
  TextEditingController? textEmail;
  TextEditingController? textName;
  TextEditingController? textPhone;
  TextEditingController? textPassword;
  GlobalKey<FormState> formStateSign=GlobalKey();


  @override
  void onInit() {
    textEmail=TextEditingController();
    textName=TextEditingController();
    textPhone=TextEditingController();
    textPassword=TextEditingController();

    super.onInit();
  }

  goToLoginPage(){
    Get.toNamed(AppRoute.login);
  }
}