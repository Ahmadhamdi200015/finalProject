import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/route.dart';
import '../../core/services/service.dart';
import '../../data/datasource/static/boarding_list.dart';

abstract class OnboardingController extends GetxController {
  void next();
  void onPageChanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  late MyService myService;
  PageController? pageController;
  int currentPage = 0;

  @override
  void onInit() {
    myService = Get.find<MyService>(); // تأجيل التهيئة إلى onInit
    pageController = PageController();
    super.onInit();
  }

  @override
  void next() {
    if (currentPage < onboardingList.length - 1) {
      currentPage++;
      pageController?.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.ease,
      );
      update();
    } else {
      myService.sharedPrefrences.setString("OnBoarding", "1");
      Get.offAllNamed(AppRoute.login);
    }
  }

  @override
  void onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
