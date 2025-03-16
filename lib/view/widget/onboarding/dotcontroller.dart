import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/boarding/onboarding_controller.dart';
import '../../../core/constant/app_color/app_color.dart';
import '../../../data/datasource/static/boarding_list.dart';

class dotController extends GetView<OnboardingControllerImp> {
  const dotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onboardingList.length,
              (index) => AnimatedContainer(
                    margin:const EdgeInsets.only(right: 5),
                    duration:const Duration(milliseconds: 600),
                    width: controller.currentpage == index ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
        ],
      ),
    );
  }
}
