import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/core/services/service.dart';
import 'package:iug/view/screen/notification/notification_page.dart';
import 'package:iug/view/screen/profile/profile_page.dart';

import '../../view/screen/home/home_page.dart';

class HomeScreenController extends GetxController{
  int currentpage=0;
  MyService myService=Get.find();

  List<Widget> listPage=const[
    HomePage(),
    NotificationPage(),
    HomePage(),
    ProfilePage()
  ];

  List<String> titlebottombar=const[
    "Home",
    "Notification",
    "Settings",
    "Profile"
  ];
  @override
  changePage(int i) {
    currentpage=i;
    update();

  }
@override
  void onInit() {
    String token=myService.sharedPrefrences.getString('token').toString();
    print(token);
    super.onInit();
  }

}