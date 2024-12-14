import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/controller/profile/order_controller.dart';

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
                  itemCount: 4,
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
                                  child: const Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Number of order : #20",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '4h ago',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: const Text(
                                      "Type Order : Delivery"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: const Text(
                                      "Type payment : Cash"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: const Text(
                                      "Delivery price :  10\$"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: const Text(
                                      "Order Status :  Pending"),
                                ),
                                const Divider(),
                                const CustomDetails(
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