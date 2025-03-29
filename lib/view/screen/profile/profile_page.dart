import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gazaStore/controller/profile/profile_controller.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';
import 'package:gazaStore/view/widget/profile/custom_bottom_sheet.dart';

import '../../widget/profile/custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller=Get.put(ProfileController());
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                child: Image.asset('assets/images/user.png'),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child:  Text(
                    controller.getName(),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
                  )),
               CustomListTile(
                onTap: (){
                  controller.goToAddressPage();
                },
                textTitle: 'Manage Address',
                leading: const Icon(
                  Icons.location_on_outlined,
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
                   // controller.goToArchivePage();
                },
                textTitle: 'My Orders Archive',
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
                      const CustomBottomSheet()
                  );
                },
              ),
            ],
          ),
        ),
      );
  }
}
