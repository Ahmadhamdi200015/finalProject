import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gazaStore/controller/order/order_controller.dart';
import 'package:gazaStore/data/model/myOrders.dart';

import '../../../core/constant/app_color/app_color.dart';

class CustomDetails extends GetView<OrderController> {
  final MyOrder myOrdersModel;
  const CustomDetails({super.key,required this.myOrdersModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          "TotalPrice: ${myOrdersModel.totalAmount}\$",
          style: const TextStyle(
              color: AppColor.primaryColor, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const SizedBox(
          width: 5,
        ),
        MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.primaryColor,
          onPressed: () {
            controller.goToDetailsPage(myOrdersModel, myOrdersModel.id!);
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
