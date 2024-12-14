import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';

class ForgetPasswordController extends GetxController{
  TextEditingController? textVerifiyCode;

  @override
  void onInit() {
    textVerifiyCode=TextEditingController();
    super.onInit();
  }

  goToChangePasswordPage(){
    Get.toNamed(AppRoute.changePasswordPage);
  }
}