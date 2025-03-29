import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gazaStore/core/constant/route.dart';

import '../../core/function/handlingdata.dart';
import '../../core/function/staterequest.dart';
import '../../data/datasource/remote/auth/signup_data.dart';

class SignUpController extends GetxController {
  TextEditingController? textEmail;
  TextEditingController? textName;
  TextEditingController? textPhone;
  TextEditingController? textPassword;
  TextEditingController? textConfirmPassword;
  late GlobalKey<FormState> formStateSign;
  SignupData signupData = SignupData(Get.find());
  StatusRequest stateRequest = StatusRequest.none;

  Future<void> SignUp() async {
    if (formStateSign.currentState!.validate()) {
      try {
        stateRequest=StatusRequest.lodaing;
        update();

        var response = await signupData.postData(textName!.text,
            textEmail!.text, textPassword!.text, textConfirmPassword!.text);
        print("============================= success");
        Get.snackbar('Success', 'SignUp is Done');
        await Get.offAllNamed(AppRoute.login);
      } catch (e) {
        stateRequest=StatusRequest.serverfailure;
        update();
        print('SignUp error: $e');
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
    formStateSign=GlobalKey();
    textEmail = TextEditingController();
    textName = TextEditingController();
    textPhone = TextEditingController();
    textPassword = TextEditingController();
    textConfirmPassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    textEmail!.dispose();
    textName!.dispose();
    textPhone!.dispose();
    textPassword!.dispose();
    textConfirmPassword!.dispose();

    super.dispose();
  }



  void goToLoginPage() {
    Get.delete<SignUpController>(); // حذف الكونترولر من الذاكرة
    Get.offAllNamed(AppRoute.login);
  }

}
