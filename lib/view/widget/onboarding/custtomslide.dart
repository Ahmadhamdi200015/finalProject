import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/boarding/onboarding_controller.dart';
import '../../../data/datasource/static/boarding_list.dart';

class CusstomSlideOnBoarding extends GetView<OnboardingControllerImp> {
  const CusstomSlideOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onboardingList.length,
        itemBuilder: (context, i) =>
            Column(
              children: [
              const SizedBox(
              height: 60,
            ),
        Image.asset(
          "${onboardingList[i].image}",
          width: 250,
          height:Get.width/1.3,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
            textAlign: TextAlign.center,
            "${onboardingList[i].title}",
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium),

          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "${onboardingList[i].body}",
              style:Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          ],
        ));
  }
}