import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/auth/login_controller.dart';
import 'package:iug/core/constant/app_color/app_color.dart';
import 'package:iug/core/function/validinput.dart';
import 'package:iug/view/widget/auth/custom_button_auth.dart';

import '../../widget/auth/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 8,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              Container(
                margin:const EdgeInsets.only(bottom: 40),
                child: const Text(
                  'Hi Welcome back , you\'ve been missed',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: controller.formStateLogin,
                child: Column(
                  children: [
                    CustomTextField(
                      validator: (val) {
                        return validInput(val!, 8, 40, 'email');
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.textEmail,
                      hintText: 'Type your Email',
                      obscureText: false,
                      label: const Text(
                        'Email',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    CustomTextField(
                      validator: (val) {
                        return validInput(val!, 8, 20, 'password');
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: controller.textPassword,
                      hintText: '*************',
                      obscureText: true,
                      label: const Text(
                        'Password',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    CustomButtonAuth(
                      txtBtn: 'Sign In',
                      onPressed: () {
                        controller.Login();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: Colors.grey.shade300,
                    )),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Text('OR')),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey.shade300,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  controller.goToSignUp();
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: ' you not a member ? ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'Register Now',
                        style: TextStyle(
                            color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
