import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/core/constant/app_color/app_color.dart';
import 'package:iug/view/widget/mycart/custtomlistcart.dart';
import 'package:iug/view/widget/mycart/custtomnavbar.dart';

import '../../../controller/process/cart_controller.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller=Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:
          const Text("MyCart", style: TextStyle(color: Colors.grey)),
          centerTitle: true,
        ),
        bottomNavigationBar:GetBuilder<CartController>(
          builder: (controller) =>CusttomNavBar(
            mycontroller: controller.coupon,
            onPressed: () async {
            },
            txtPrice:'360'
          ),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => ListView(
              children: [
                const SizedBox(height: 20,),
                Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child:  Text(
                    "You Have ${controller.cartList.length} items in Your List",
                    style: const TextStyle(color:Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.cartList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CusttomListCart(
                          image:
                          "assets/images/phone.png",
                          title: Text(
                              "${controller.cartList[index]['product_id']}"),
                          subtitle:
                          "350\$",
                          textCount:
                          "2",
                          onAdd: () async {
                            // controller.statusRequest;
                            // // await controller.add(controller.data[index]
                            // ['items_id']
                            //     .toString());
                            // controller.refreshView();
                          },
                          onDelete: () async {
                            // controller.statusRequest;
                            // await controller.delete(controller.data[index]
                            // ['items_id']
                            //     .toString());
                            // controller.refreshView();
                          });
                    },
                  ),
                )
              ],
            ),

        ));
  }
}
