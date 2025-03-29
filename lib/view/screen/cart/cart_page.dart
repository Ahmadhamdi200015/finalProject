import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gazaStore/core/constant/app_color/app_color.dart';
import 'package:gazaStore/view/widget/mycart/custtomlistcart.dart';
import 'package:gazaStore/view/widget/mycart/custtomnavbar.dart';
import 'package:gazaStore/view/widget/public/handlingdataview.dart';

import '../../../applink.dart';
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
            onPressed: () async {
            },
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
          child: Text(
            "You Have ${controller.cartList.length} items in Your List",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<CartController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.cartList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var cartItem = controller.cartList[index];
              return CusttomListCart(
                image: "${AppLink.imagesItems}${cartItem.product!.productImage}",
                title: Text("${cartItem.product!.name}"),
                subtitle: "${cartItem.product!.priceAfterDiscount} \$",  // You might want to replace this with dynamic data
                textCount: "${cartItem.quantity}",
                onAdd: () async {
                  if (cartItem.quantity! >0) {
                    await controller.updateQuantity(cartItem.id, cartItem.quantity! + 1);
                    controller.refreshView();
                  }
                },
                onDelete: () async {
                  if (cartItem.quantity == 1) {
                    await controller.delete(cartItem.id);
                    controller.refreshView();

                  }else{
                    await controller.updateQuantity(cartItem.id, cartItem.quantity! -1);
                    controller.refreshView();

                  }
                },
              );

            },
          ),),)
        ),
      ],
    ),
    ),
    );
  }
}
