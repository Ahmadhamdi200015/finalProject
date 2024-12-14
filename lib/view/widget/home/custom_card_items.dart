import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/home/home_page_controller.dart';

import '../../../core/constant/app_color.dart';

class CustomCardItems extends GetView<HomePageController>{
  final String imagePath;
  final String productName;
  final void Function()? onTap;
  const CustomCardItems({super.key,required this.onTap,required this.imagePath,required this.productName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: AppColor.secondColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    imagePath,
                    width: 100,
                    height: 100,
                  ),
                ),

            Container(
              margin: const EdgeInsets.only(top: 10),
              child:  Text(
                productName,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}