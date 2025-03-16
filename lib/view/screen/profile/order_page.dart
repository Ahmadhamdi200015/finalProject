import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/order/order_controller.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/app_color/app_color.dart';
import '../../widget/orders/custtomDetails.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
   return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Orders",
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GetBuilder<OrderController>(
            builder: (controller) =>
                ListView.builder(
                  itemCount: controller.listOrders.length,
                  itemBuilder: (context, index) =>
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                          elevation: 2.0,
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 10),
                                  child:  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Number of order : #${controller.listOrders[index].id}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        Jiffy.parse(
                                            '${controller.listOrders[index].orderDate}')
                                            .fromNow(),
                                        style: const TextStyle(
                                            color: AppColor.fourthColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child:  Text(
                                      "Type Order : ${controller.printTypeOrder(controller.listOrders[index].isHomeDelivery)}"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child:  Text(
                                      "Type payment : ${controller.printMethodOrder(controller.listOrders[index].paymentMethod)}"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child:  Text(
                                      "Delivery price :  ${controller.listOrders[index].deliveryPrice}\$"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child:  Text(
                                      "Order Status :  ${controller.listOrders[index].status}"),
                                ),
                                const Divider(),
                                 CustomDetails(myOrdersModel:controller.listOrders[index],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ),
          ),
        )
    );
  }
}