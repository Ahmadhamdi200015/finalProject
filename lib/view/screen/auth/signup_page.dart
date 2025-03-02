import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/auth/sign_up_controller.dart';
import 'package:iug/core/constant/app_color/app_color.dart';

import '../../../core/function/validinput.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    var height = MediaQuery
        .sizeOf(context)
        .height;
    var width = MediaQuery
        .sizeOf(context)
        .width;
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              margin:const EdgeInsets.only(bottom: 10),
              child: const  Text(textAlign: TextAlign.center,
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
            ),
            Container(margin:const EdgeInsets.only(bottom: 40),child: const  Text('Fill your information below or register\n  with your social account.',style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,))
              ,
              Form(
                key: controller.formStateSign,
                child: Column(children: [
                  CustomTextField(
                    validator: (val) {
                      return validInput(val!, 8, 40, '');
                    },
                    keyboardType: TextInputType.name,
                    controller: controller.textName,
                    hintText: ' Ex. john Doe',
                    obscureText: false, label: const Text('Name',style: TextStyle(color: Colors.black),),
                  ),
                  CustomTextField(
                    validator: (val) {
                      return validInput(val!, 8, 40, 'email');
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.textEmail,
                    hintText: ' example@gmail.com',
                    obscureText: false, label:const Text('Email',style: TextStyle(color: Colors.black),),
                  ),
                  CustomTextField(
                    validator: (val) {
                      return validInput(val!, 8, 40, 'password');
                    },
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller.textPassword,
                    hintText: ' ********',
                    obscureText: true, label:const Text('Password',style: TextStyle(color: Colors.black),),
                  ),
                  CustomTextField(
                    validator: (val) {
                      return validInput(val!, 8, 40, 'password');
                    },
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller.textConfirmPassword,
                    hintText: ' ********',
                    obscureText: true, label:const Text('Password',style: TextStyle(color: Colors.black),),
                  ),
                  CustomButtonAuth(
                    txtBtn: 'Sign Up',
                    onPressed: () async{
                     await controller.SignUp();
                    },
                  ),
                ],),
              )
              , const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey.shade300,
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: const Text('OR',style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),)),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.grey.shade300,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/facebook.png',
                      width: MediaQuery
                          .sizeOf(context)
                          .width / 10,
                      height: MediaQuery
                          .sizeOf(context)
                          .height / 10,
                    ),
                    Image.asset(
                      'assets/images/googl.png',
                      width: MediaQuery
                          .sizeOf(context)
                          .width / 10,
                      height: MediaQuery
                          .sizeOf(context)
                          .height / 10,
                    ),
                    Image.asset(
                      'assets/images/twitter.png',
                      width: MediaQuery
                          .sizeOf(context)
                          .width / 10,
                      height: MediaQuery
                          .sizeOf(context)
                          .height / 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  controller.goToLoginPage();
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: ' already have an account ? ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'Login Now',
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
