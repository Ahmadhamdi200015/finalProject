import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/data/datasource/remote/auth/forgetpassword_data.dart';

class ForgetPasswordController extends GetxController{
  TextEditingController? textVerifiyCode;
  ForgetPasswordData forgetPasswordData=ForgetPasswordData(Get.find());
  String email='';

  @override
  void onInit() {
    email=Get.arguments['email'];
    textVerifiyCode=TextEditingController();
    super.onInit();
  }

  resetPassword()async{
    var response=await forgetPasswordData.postData(email);
    if(response is Map){
      print(response);

    }else{
      print('response');
    }
  }

  goToChangePasswordPage()async{
   // await resetPassword();
    Get.toNamed(AppRoute.changePasswordPage);
  }
}