import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gazaStore/applink.dart';
import 'package:gazaStore/controller/home/home_page_controller.dart';
import 'package:gazaStore/data/model/itemsmodel.dart';

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

                  child: CachedNetworkImage(
                    width: 100,
                    height: 100,
                    imageUrl: "${AppLink.imagesItems}${itemsModel.productImage!}",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),

            Container(
              margin: const EdgeInsets.only(top: 10),
              child:  Text(
                itemsModel.name!,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child:  Text(
                "\$${itemsModel.priceAfterDiscount!}",
                style:  TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}