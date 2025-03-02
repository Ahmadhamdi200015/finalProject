import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/applink.dart';
import 'package:iug/controller/items/products_details_controller.dart';
import 'package:iug/core/constant/app_color/app_color.dart';
import 'package:iug/core/constant/route.dart';
import 'package:iug/view/widget/public/handlingdataview.dart';

import '../../widget/details/custtomiconbtn.dart';

class ItemsDetailsPage extends StatelessWidget {
  const ItemsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsDetailsController controller = Get.put(ProductsDetailsController());
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: AppColor.thirdColor,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(-1, -1), // ظل في الأعلى واليسار
              ),
            ]),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(color: AppColor.thirdColor),
                ),
                Text(
                  '${controller.itemsModel.itemsPrice}\$',
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
            MaterialButton(
              minWidth: MediaQuery.sizeOf(context).width / 1.8,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: AppColor.primaryColor,
              onPressed: () {
                controller.addItems(controller.itemsModel);
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2.2,
            width: MediaQuery.sizeOf(context).width,
            color: AppColor.secondColor,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  color: Colors.transparent,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_back))),
                      const Text(
                        'Products Details',
                        style:
                            TextStyle(color: AppColor.thirdColor, fontSize: 22),
                      ),
                      const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.favorite_border_outlined))
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.network(
                    fit: BoxFit.fill,
                    '${AppLink.imagesItems}/${controller.itemsModel.itemsImage}',
                    width: 250,
                    height: 250,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${controller.itemsModel.itemsBrand}",
                      style: const TextStyle(
                        color: AppColor.fourthColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                GetBuilder<ProductsDetailsController>(
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${controller.itemsModel.itemsName}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                            ],
                          ),
                          Spacer(),
                          CusttomIconBtn(
                              icon: Icons.add,
                              onPressed: () async {
                                await controller.add();
                              }),
                          Container(
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.fourthColor, width: 2),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "${controller.countItems}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          CusttomIconBtn(
                              icon: Icons.remove,
                              onPressed: () async {
                                await controller.delete();
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Product Details ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${controller.itemsModel.itemsDesc}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Select Color : ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "blue",
                      style: TextStyle(color: AppColor.thirdColor),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
