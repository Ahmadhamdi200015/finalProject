import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iug/core/constant/route.dart';
import 'package:iug/data/model/itemsmodel.dart';

import '../../core/function/handlingdata.dart';
import '../../core/function/staterequest.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/cart/cart_data.dart';

class ProductsDetailsController extends GetxController {
  CartData cartData = CartData(Get.find());
  MyService myService = Get.find();
  late ItemsModel itemsModel;
  int countItems = 0;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
    super.onInit();
  }

  addItems(ItemsModel itemsModel) async {
    statusRequest = StatusRequest.lodaing;
    try {
      var response = await cartData.AddCart(itemsModel.itemsId!, countItems);
      Get.snackbar("Success", "Add product Success to Cart ");
      Get.toNamed(AppRoute.cartPage);
    } catch (e) {
      print("e:$e=======================");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  // deleteItems(ItemsModel itemsModel) async {
  //   statusRequest = StatusRequest.lodaing;
  //   try {
  //     var response = await cartData.DeleteCart(itemsModel.itemsId!,countItems);
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         Get.snackbar("Success", "Delete product Success from Cart ");
  //       }
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   } catch (e) {
  //     print("$e");
  //     statusRequest = StatusRequest.serverfailure;
  //   }
  //   update();
  // }

  add() {
    countItems++;
    update();
  }

  @override
  delete() {
    if (countItems > 0) {
      countItems--;
    }

    update();
  }
}
