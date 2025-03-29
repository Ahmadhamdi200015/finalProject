import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/core/services/service.dart';
import 'package:gazaStore/view/screen/notification/notification_page.dart';
import 'package:gazaStore/view/screen/profile/profile_page.dart';

import '../../view/screen/home/home_page.dart';
import '../../view/screen/items/offers_page.dart';
import '../../view/screen/profile/order_page.dart';

class HomeScreenController extends GetxController{
  int currentpage=0;
  MyService myService=Get.find();

  List<Widget> listPage=const[
    HomePage(),
    OrderPage(),
    OffersPage(),
    ProfilePage()
  ];

  List<String> titlebottombar=const[
    "Home",
    "Orders",
    "Offers",
    "Profile"
  ];
  @override
  changePage(int i) {
    currentpage=i;
    update();

  }
  goToCart(){
    Get.toNamed(AppRoute.cartPage);
  }
@override
  void onInit() {
    String token=myService.sharedPrefrences.getString('token').toString();
    print(token);
    super.onInit();
  }

}