import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gazaStore/applink.dart';
import 'package:gazaStore/controller/items/products_details_controller.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/view/widget/public/handlingdataview.dart';

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
                  '${controller.itemsModel.priceAfterDiscount}\$',
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
                controller.addItemsToCart(controller.itemsModel);
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
                      InkWell(
                        onTap: (){
                          // controller.addToFav(controller.itemsModel.itemsId!);
                        },
                        child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.favorite_border_outlined)),
                      )
                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    width: 250,
                    height: 250,
                    imageUrl: "${AppLink.imagesItems}${controller.itemsModel.productImage}",
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      "${controller.itemsModel.brand}",
                      style: const TextStyle(
                        color: AppColor.thirdColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Product Name :',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                GetBuilder<ProductsDetailsController>(
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${controller.itemsModel.name}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Spacer(),
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
                const Divider(),

                const Text(
                  'Product Details :',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                      ),
                ),
                Text(
                  ' ${controller.itemsModel.description}',
                  style: const TextStyle(color: Colors.black,fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
