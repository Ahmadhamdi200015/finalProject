import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gazaStore/controller/auth/change_password_controller.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';
import 'package:gazaStore/core/function/validinput.dart';
import 'package:gazaStore/view/widget/auth/custom_button_auth.dart';
import 'package:gazaStore/view/widget/auth/custom_text_field.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePasswordController controller = Get.put(ChangePasswordController());
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: controller.formState,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "New Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )),
                const Text(
                    textAlign: TextAlign.center,
                    "Your New Password must be diffrent \n from previously used password",
                    style: TextStyle(color: AppColor.thirdColor)),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  hintText: 'Type Your Email',
                  obscureText: false,
                  controller: controller.textEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    return validInput(val!, 8, 30, 'email');
                  },
                  label: const Text(
                    'Email',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                CustomTextField(
                  hintText: '************',
                  obscureText: true,
                  controller: controller.textPassword,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) {
                    return validInput(val!, 8, 30, 'password');
                  },
                  label: const Text(
                    'Password',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                CustomTextField(
                  hintText: '************',
                  obscureText: true,
                  controller: controller.textConfirmPassword,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) {
                    return validInput(val!, 8, 30, 'password');
                  },
                  label: const Text(
                    'Confirm Password',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                CustomButtonAuth(
                    txtBtn: 'Confirm',
                    onPressed: () {
                      controller.changePassword();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
