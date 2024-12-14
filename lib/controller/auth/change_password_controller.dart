import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';

class ChangePasswordController extends GetxController{
  TextEditingController? textPassword;
  TextEditingController? textConfirmPassword;
  GlobalKey<FormState>formState=GlobalKey();

@override
  void onInit() {
    textPassword=TextEditingController();
    textConfirmPassword=TextEditingController();
    super.onInit();
  }

  changePassword(){
  if(formState.currentState!.validate()){
    Get.offAllNamed(AppRoute.homePage);
  }
  }
}