import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/profile/profile_controller.dart';

import '../../../core/constant/app_color/app_color.dart';

class CustomBottomSheet extends StatelessWidget{
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller=Get.put(ProfileController());
    return Container(
      height: MediaQuery.sizeOf(context).height/4,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: AppColor.thirdColor,
              offset: Offset(-1, -1),
              blurRadius: 1,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'LogOut',
            style: TextStyle(
                color: AppColor.thirdColor, fontSize: 22),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'Are You Sure you want to logout',
              style: TextStyle(color: AppColor.thirdColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: MediaQuery.sizeOf(context).width/2.5,
                padding: const EdgeInsets.symmetric(vertical: 13),
                color: AppColor.secondColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: AppColor.primaryColor),
                ),
              ),
              const SizedBox(width: 10,),
              MaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 13),
                minWidth: MediaQuery.sizeOf(context).width/2.5,
                color: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  controller.logOut();

                },
                child: const Text(
                  'LogOut',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}