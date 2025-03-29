import 'package:flutter/material.dart';
import 'package:gazaStore/core/services/service.dart';
import 'package:get/get.dart';

import '../constant/route.dart';

class MyUserMiddleware extends GetMiddleware{
  @override
  int? get  priority => 1;

  MyService myService=Get.find();

  @override
  RouteSettings? redirect(String? route){
    String userId = myService.sharedPrefrences.getString('userId') ?? '';
    if(userId.isNotEmpty){
      return const RouteSettings(name: AppRoute.homeScreen);

    }
    return null;

  }

}