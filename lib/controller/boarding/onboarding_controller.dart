import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/route.dart';
import '../../core/services/service.dart';
import '../../data/datasource/static/boarding_list.dart';

abstract class OnboardingController extends GetxController{
  next();

  onPageChanged(int index);

}

class OnboardingControllerImp extends OnboardingController{
  MyService myService=Get.find();
  PageController? pageController;
  int currentpage=0;
  @override
  next() {
    currentpage++;
    if(currentpage>onboardingList.length-1){
      myService.sharedPrefrences.setString("OnBoarding", "1");
      Get.offAllNamed(AppRoute.login);
    }else{
      pageController?.animateToPage(currentpage, duration: const Duration(milliseconds: 900), curve:Curves.ease);
    }

  }

  @override
  onPageChanged(int index) {
    currentpage=index;
    update();

  }
  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }

}