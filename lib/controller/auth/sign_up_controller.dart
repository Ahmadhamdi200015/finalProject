import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';

import '../../core/function/handlingdata.dart';
import '../../core/function/staterequest.dart';
import '../../data/datasource/remote/auth/signup_data.dart';

class SignUpController extends GetxController {
  TextEditingController? textEmail;
  TextEditingController? textName;
  TextEditingController? textPhone;
  TextEditingController? textPassword;
  TextEditingController? textConfirmPassword;
  GlobalKey<FormState> formStateSign = GlobalKey();
  SignupData signupData = SignupData(Get.find());
  StatusRequest stateRequest = StatusRequest.none;

  Future<void> SignUp() async {
    if (formStateSign.currentState!.validate()) {
      try {
        print("============================= try");

        var response = await signupData.postData(textName!.text,
            textEmail!.text, textPassword!.text, textConfirmPassword!.text);
        print("============================= success");
        Get.snackbar('Success', 'SignUp is Done');
        await Get.offAllNamed(AppRoute.login);
      } catch (e) {
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
    textEmail = TextEditingController();
    textName = TextEditingController();
    textPhone = TextEditingController();
    textPassword = TextEditingController();
    textConfirmPassword = TextEditingController();

    super.onInit();
  }

  goToLoginPage() {
    Get.toNamed(AppRoute.login);
  }
}
