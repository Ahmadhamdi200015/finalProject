import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/applink.dart';
import 'package:iug/controller/home/home_page_controller.dart';
import 'package:iug/data/model/itemsmodel.dart';

import '../../../core/constant/app_color/app_color.dart';

class CustomCardItems extends GetView<HomePageController>{
  final ItemsModel itemsModel;
  const CustomCardItems({super.key,required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        controller.goToItemsDetails(itemsModel);
      },
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
                  child: Image.network(
                    "${AppLink.imagesItems}/${itemsModel.itemsImage!}",
                    width: 100,
                    height: 100,
                  ),
                ),

            Container(
              margin: const EdgeInsets.only(top: 10),
              child:  Text(
                itemsModel.itemsName!,
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