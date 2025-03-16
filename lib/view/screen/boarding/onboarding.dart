import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/boarding/onboarding_controller.dart';
import '../../../core/constant/app_color/app_color.dart';
import '../../widget/onboarding/buttoncontroller.dart';
import '../../widget/onboarding/custtomslide.dart';
import '../../widget/onboarding/dotcontroller.dart';

class Onboarding extends GetView<OnboardingControllerImp> {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return const Scaffold(
      backgroundColor: AppColor.secondColor,
        body: SafeArea(
      child: Column(
        children: [
          Expanded(flex: 3, child: CusstomSlideOnBoarding()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  dotController(),
                  SizedBox(
                    height: 40,
                  ),
                  CusttomButtonController(),
                ],
              ))
        ],
      ),
    ));
  }
}
