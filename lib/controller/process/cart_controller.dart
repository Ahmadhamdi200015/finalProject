import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iug/core/function/staterequest.dart';

import '../../core/constant/route.dart';
import '../../core/function/handlingdata.dart';

class CartController extends GetxController{
  // CartData cartData = CartData(Get.find());

  StatusRequest statusRequest = StatusRequest.lodaing;
  // MyService myService = Get.find();
  int totalPriceItems = 0;
  int discountCoupon=0;
  String? nameCoupon;
  String? couponId;

  var totalCount = 0;
  // late Itemsmodel itemsmodel;
  List data = [];
  String totalcoupon = "0";
  // MyCouponModel? myCouponModel;

  late TextEditingController coupon;

  @override
  void onInit() {
    coupon = TextEditingController();
    // getCart();
  }

  @override
  getTotalPriceCoupon() {
    print(discountCoupon);
    var total=totalPriceItems - totalPriceItems * discountCoupon! / 100;
    return total+10;
  }


  goToCheckOutPage(){
    Get.toNamed(AppRoute.checkoutPage);
  }
  refreshView() {
    resetVarData();
    // getCart();
    update();
  }

  resetVarData() {
    totalPriceItems = 0;
    totalCount = 0;
  }

  // checkCoupon() async {
  //   statusRequest = StatusRequest.lodaing;
  //   update();
  //   var response = await cartData.checkCoupon(coupon.text);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       Map<String, dynamic> responseCoupon = response['data'];
  //       myCouponModel = MyCouponModel.fromJson(responseCoupon);
  //       discountCoupon = myCouponModel!.CouponDiscount!;
  //       nameCoupon = myCouponModel!.CouponName;
  //       couponId = myCouponModel?.CouponId.toString();
  //       update();
  //     } else {
  //       Get.snackbar("Coupon info", "may Coupon there is not yet");
  //     }
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //   }
  //   update();
  //
  // }



  // add(itemsId) async {
  //   statusRequest = StatusRequest.lodaing;
  //   try {
  //     var response = await cartData.AddCart(
  //         myService.sharedPrefrences.getString("userid")!, itemsId.toString());
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         Get.snackbar("Success", "Add Success ");
  //         ProductsdetailsControllerImp c =
  //         Get.put(ProductsdetailsControllerImp());
  //         c.refreshPage();
  //       }
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   } catch (e) {
  //     statusRequest = StatusRequest.serverfailure;
  //   }
  //   update();
  // }

  // delete(itemsId) async {
  //   statusRequest = StatusRequest.lodaing;
  //   try {
  //     var response = await cartData.DeleteCart(
  //         myService.sharedPrefrences.getString("userid")!, itemsId.toString());
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         Get.snackbar("Success", "delete Success ");
  //         ProductsdetailsControllerImp c =
  //         Get.put(ProductsdetailsControllerImp());
  //         c.refreshPage();
  //       }
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   } catch (e) {
  //     statusRequest = StatusRequest.serverfailure;
  //   }
  //   update();
  // }

  // getCart() async {
  //   data.clear();
  //   statusRequest = StatusRequest.lodaing;
  //   update();
  //   var response = await cartData
  //       .viewCart(myService.sharedPrefrences.getString("userid")!);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       if (response['datacart']['status'] == "success") {
  //         data.clear();
  //         Map responsetotalitems = response["countprice"];
  //         totalCount = int.parse(responsetotalitems["totalcount"]);
  //         totalPriceItems =
  //             int.parse(responsetotalitems["totalprice"].toString());
  //         data.addAll(response['datacart']['data']);
  //       } else {
  //         totalCount = 0;
  //         totalPriceItems = 0;
  //       }
  //     } else {
  //       Get.defaultDialog(
  //         title: "Warning",
  //         middleText: "Categories view not found ",
  //       );
  //     }
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //   }
  //   update();
  // }

  @override
  void dispose() {
    coupon.dispose();
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