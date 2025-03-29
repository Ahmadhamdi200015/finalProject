import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gazaStore/core/function/staterequest.dart';
import 'package:gazaStore/data/model/MyCart.dart';

import '../../core/constant/route.dart';
import '../../core/function/handlingdata.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/cart/cart_data.dart';
import '../../data/model/cartmodel.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  // cartItems cartModel = cartItems();
  MyCart myCartModel = MyCart();

  StatusRequest statusRequest = StatusRequest.lodaing;
  MyService myService = Get.find();
  double totalPriceItems = 0;
  num totalPriceItemsWithShipping = 10;
  int discountCoupon = 0;
  String? nameCoupon;
  String? couponId;
  List<Items> cartList = [];

  var totalCount = 0;

  List data = [];

  late TextEditingController coupon;

  void onInit() {
    getCart();
    super.onInit();
  }

  goToCheckOutPage() {
    if(cartList.isEmpty){
      return Get.snackbar('Warning!', 'Add Products To Your Cart');
    }
    Get.toNamed(AppRoute.checkoutPage,
        arguments: {"orderPrice": totalPriceItems});
  }

  refreshView() {
    resetVarData();
    // getCart();
    update();
  }

  resetVarData() {
    totalPriceItems = 0;
    totalCount = 0;
    getCart();
    update();
  }

  updateQuantity(cartId, int quantity) async {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await cartData.updateCart(cartId, quantity);
      Get.snackbar("Success", "update Success ");
      statusRequest=StatusRequest.none;
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
    update();
  }

  delete(itemsId) async {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await cartData.deleteCart(itemsId);
      Get.snackbar("Success", "Delete Success ");
      statusRequest=StatusRequest.none;
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
    update();
  }

  getCart() async {
    statusRequest = StatusRequest.lodaing;
    update();

    var response = await cartData.viewCart();

    // التأكد من أن response هو Map ويحتوي على مفتاح "items"
    if (response is Map<String, dynamic> && response.containsKey("items")) {
      var items = response["items"];
      if (items is List) {
        if (items.isNotEmpty) {
          cartList.clear();
          cartList
              .addAll(items.map<Items>((e) => Items.fromJson(e)).toList());
          print("Cart items loaded successfully: $cartList");
          for(var i=0; i<items.length; i++){
            totalPriceItems+=double.parse(cartList[i].product!.priceAfterDiscount!) * cartList[i].quantity!.toInt() ;
          }
          print(totalPriceItems);
        }
      } else {
        print("Error: 'items' is not a List");
        statusRequest = StatusRequest.serverfailure;
      }
    } else {
      print("Error: Unexpected response format");
      statusRequest = StatusRequest.serverfailure;
    }

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

// GoToCheckOut() {
//   Get.offAllNamed(AppRoute.CheckoutPage, arguments: {
//     "ordersprice": totalPriceItems,
//     "couponid": couponId.toString(),
//     "coupondiscounted": discountCoupon.toString()
//   });
// }
}
