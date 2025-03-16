import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../controller/order/details_order_controller.dart';
import '../../../core/constant/app_color/app_color.dart';
import '../../widget/public/handlingdataview.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsOrderController controller = Get.put(DetailsOrderController());
    return Scaffold(
        backgroundColor: AppColor.secondColor,
        appBar: AppBar(
          backgroundColor: AppColor.secondColor,
          title: Text(
            "Details Order",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<DetailsOrderController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(
                children: [
                  Card(
                    elevation: 2.0,
                      color: AppColor.secondColor,
                      child: Table(
                        children: [
                          TableRow(children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              child: const Text(
                                "City",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Street",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Price Delivery",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${controller.orderModel.deliveryAddress}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${controller.orderModel.deliveryAddress}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${controller.orderModel.deliveryPrice}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: AppColor.primaryColor),
                              ),
                            ),
                          ])
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Card(
                        color: AppColor.secondColor,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "TotalPrice",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.fourthColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${controller.orderModel.totalAmount}\$",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        )),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.detailsList.length,
                      itemBuilder: (context, index){
                        var orderDetailsList=controller.detailsList[index];
                        return Card(
                          elevation: 2.0,
                          color: AppColor.secondColor,
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: "${AppLink.imagesItems}${orderDetailsList.product!.productImage}",
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                              Text(
                                "${orderDetailsList.product!.name}",
                                style:const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "${orderDetailsList.product!.description}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
