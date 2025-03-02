import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/auth/forget_password_controller.dart';
import 'package:iug/core/constant/app_color/app_color.dart';
import 'package:iug/view/widget/auth/custom_button_auth.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ForgetPassword"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/security.png',
                  width: width / 2,
                  height: height / 6,
                ),
                SizedBox(
                  height: height / 7,
                ),
                TextFormField(
                  controller: controller.textVerifiyCode,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white,width: 2),

                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Verification Code',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: AppColor.secondColor,
                      filled: true),
                ),
                CustomButtonAuth(
                    txtBtn: 'Confirm',
                    onPressed: () {
                      controller.goToChangePasswordPage();
                    })
              ],
            ),

        ),
      ),
    );
  }
}
