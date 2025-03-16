import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/route.dart';
import '../services/service.dart';

class MyMiddleware extends GetMiddleware{
  @override
  int? get  priority => 0;

  MyService myService=Get.find();

  @override
  RouteSettings? redirect(String? route){
    String onBoarding=myService.sharedPrefrences.getString('OnBoarding') ?? '';
    if(onBoarding=="1"){
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }

}