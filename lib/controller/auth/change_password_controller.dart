import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';
import 'package:iug/core/services/service.dart';
import 'package:iug/data/datasource/remote/auth/resetpassword_data.dart';

class ChangePasswordController extends GetxController {
  TextEditingController? textPassword;
  TextEditingController? textConfirmPassword;
  TextEditingController? textEmail;
  MyService myService=Get.find();
  String token='';
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  GlobalKey<FormState> formState = GlobalKey();

  @override
  void onInit() {
    textPassword = TextEditingController();
    textConfirmPassword = TextEditingController();
    textEmail = TextEditingController();

    super.onInit();
  }

  changePassword() async {
    if (formState.currentState!.validate()) {
      var response = await resetPasswordData.postData(
         textEmail!.text, textPassword!.text, textConfirmPassword!.text);
      print(response);
    }
  }
}
