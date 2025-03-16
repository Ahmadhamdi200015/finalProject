import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:iug/core/constant/app_color/app_color.dart';

import '../../../controller/process/cart_controller.dart';

class CusttomNavBar extends GetView<CartController> {

  final void Function()? onPressed;

  const CusttomNavBar(
      {super.key,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: AppColor.thirdColor,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(-1, -1), // ظل في الأعلى واليسار
          ),
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Price Products",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.thirdColor, fontSize: 18),
                      ),
                      Text("${controller.totalPriceItems}\$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("DisCounted",
                          style: TextStyle(
                              color: AppColor.thirdColor,
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("${controller.discountCoupon}%",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping",
                          style: TextStyle(
                              color: AppColor.thirdColor,
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(
                        "10\$",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("TotalPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("${controller.totalPriceItems}\$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 500,
              child: MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: const EdgeInsets.symmetric(vertical: 13),
                color: AppColor.primaryColor,
                onPressed: () {
                  controller.goToCheckOutPage();
                },
                child: const Text(
                  "Proceed to CheckOut",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
