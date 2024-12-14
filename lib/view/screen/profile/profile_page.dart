import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/profile/profile_controller.dart';
import 'package:iug/core/constant/app_color.dart';
import 'package:iug/view/widget/profile/custom_bottom_sheet.dart';

import '../../widget/profile/custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller=Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: AppColor.thirdColor),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                child: Image.asset('assets/images/user.png'),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Ether Howard',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
                  )),
              const CustomListTile(
                textTitle: 'Your Profile',
                leading: Icon(
                  Icons.person_outline,
                  color: AppColor.primaryColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.primaryColor,
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              const CustomListTile(
                textTitle: 'Manage Address',
                leading: Icon(
                  Icons.location_on_outlined,
                  color: AppColor.primaryColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.primaryColor,
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
               CustomListTile(
                onTap: (){
                  controller.goToOrderPage();
                },
                textTitle: 'My Orders',
                leading: const Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColor.primaryColor,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.primaryColor,
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
               CustomListTile(
                onTap: () {
                   controller.goToArchivePage();
                },
                textTitle: 'My Archive',
                leading: const Icon(
                  Icons.archive_outlined,
                  color: AppColor.primaryColor,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.primaryColor,
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
               CustomListTile(
                 onTap: (){
                   controller.goToAboutPage();
                 },
                textTitle: 'About Us',
                leading: const Icon(
                  Icons.info_outline,
                  color: AppColor.primaryColor,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.primaryColor,
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              CustomListTile(
                textTitle: 'LogOut',
                leading: const Icon(
                  Icons.logout_outlined,
                  color: AppColor.primaryColor,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.primaryColor,
                ),
                onTap: () {
                  Get.bottomSheet(
                      CustomBottomSheet()
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
