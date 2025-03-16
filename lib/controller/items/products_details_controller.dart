import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iug/core/constant/route.dart';
import 'package:iug/data/datasource/remote/favorites/favorites_data.dart';
import 'package:iug/data/model/itemsmodel.dart';

import '../../core/function/handlingdata.dart';
import '../../core/function/staterequest.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/cart/cart_data.dart';

class ProductsDetailsController extends GetxController {
  CartData cartData = CartData(Get.find());
  FavoritesData favoritesData = FavoritesData(Get.find());
  MyService myService = Get.find();
  late ItemsModel itemsModel;
  int countItems = 0;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
    super.onInit();
  }

  addItemsToCart(ItemsModel itemsModel) async {
    statusRequest = StatusRequest.lodaing;
    try {
      var response = await cartData.addCart(itemsModel.itemsId!, countItems);
      Get.snackbar("Success", "Add product Success to Cart ");
      Get.toNamed(AppRoute.cartPage);
    } catch (e) {
      print("e:$e=======================");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  addToFav(int productId) {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = favoritesData.addFav(productId);
      Get.snackbar("Success", "Add product Success to Favorites ");
    } catch (e) {
      print("e:$e=======================");
      statusRequest = StatusRequest.serverfailure;
      update();
    }
    update();
  }

  removeFav(int productId){
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = favoritesData.removeFav(productId);
      Get.snackbar("Success", "Add product Success to Favorites ");
    } catch (e) {
      print("e:$e=======================");
      statusRequest = StatusRequest.serverfailure;
      update();
    }
    update();

  }

  add() {
    countItems++;
    update();
  }

  delete() {
    if (countItems > 0) {
      countItems--;
    }

    update();
  }
}
