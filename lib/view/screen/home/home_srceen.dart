import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/app_color/app_color.dart';
import 'package:iug/view/widget/public/custtombottombar.dart';

import '../../../controller/home/home_screen_controller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
        builder: (controller) => Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar:BottomAppBar(
            color:Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child:  Row(
              children: [
                Row(
                  children: [
                    CusttomBottomBar(
                      textBottom: controller.titlebottombar[0],
                      onPressed: () {
                        controller.changePage(0);
                      },
                      active: controller.currentpage == 0 ? true : false,
                      iconBottom: Icons.home_outlined,
                    ),
                    CusttomBottomBar(
                      textBottom: controller.titlebottombar[1],
                      onPressed: () {
                        controller.changePage(1);
                      },
                      active: controller.currentpage == 1 ? true : false,
                      iconBottom: Icons.notifications_none_outlined,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    CusttomBottomBar(
                      textBottom: controller.titlebottombar[2],
                      onPressed: () {
                        controller.changePage(2);
                      },
                      active: controller.currentpage == 2 ? true : false,
                      iconBottom: Icons.settings_outlined,
                    ),
                    CusttomBottomBar(
                      textBottom: controller.titlebottombar[3],
                      onPressed: () {
                        controller.changePage(3);
                      },
                      active: controller.currentpage == 3 ? true : false,
                      iconBottom: Icons.person_outline,
                    ),
                  ],
                ),
              ],
            ),

          ),

          body: WillPopScope(
            child: Container(
              color: Colors.white,
              child: controller.listPage.elementAt(controller.currentpage),
            ),
            onWillPop: () async {
              Get.defaultDialog(
                  title: "Warning",
                  middleText: "Do you want to exit from App",
                  onCancel: () {},
                  onConfirm: () {
                    exit(0);
                  });
              return Future.value(false);
            },
          ),
        ));
  }
}
