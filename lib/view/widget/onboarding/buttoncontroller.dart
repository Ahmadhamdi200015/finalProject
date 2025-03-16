import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/boarding/onboarding_controller.dart';
import '../../../core/constant/app_color/app_color.dart';

class CusttomButtonController extends GetView<OnboardingControllerImp> {
  const CusttomButtonController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding:const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        child: const Text(
          "Next",
          style:TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
