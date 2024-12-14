import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/view/screen/notification/notification_page.dart';
import 'package:iug/view/screen/profile/profile_page.dart';

import '../../view/screen/home/home_page.dart';

class HomeScreenController extends GetxController{
  int currentpage=0;

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


}