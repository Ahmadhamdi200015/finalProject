import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iug/controller/profile/order_controller.dart';

import '../../../core/constant/app_color/app_color.dart';

class CustomDetails extends GetView<OrderController> {

  const CustomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "TotalPrice: 360\$",
          style: TextStyle(
              color: AppColor.primaryColor, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
          MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColor.primaryColor,
            onPressed: () {
            },
            child: const Text(
              "Tracking",
              style: TextStyle(color: Colors.white),
            ),
          ),
        const SizedBox(
          width: 5,
        ),
        MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.primaryColor,
          onPressed: () {
          },
          child: const Text(
            "Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
