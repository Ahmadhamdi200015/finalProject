import 'package:get/get.dart';
import 'package:gazaStore/core/function/staterequest.dart';
import 'package:gazaStore/data/datasource/remote/products/products_data.dart';
import 'package:gazaStore/data/model/itemsmodel.dart';

import '../../core/constant/route.dart';

class OffersController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ProductsData productsData = ProductsData(Get.find());
  List<ItemsModel> productsOffer = [];

  fetchOffersProducts() async {
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await productsData.fetchProductsDiscount();
    if (response is List) {
      if (response.isNotEmpty) {
        productsOffer.addAll(response
            .map<ItemsModel>((e) => ItemsModel.fromJson(e))
            .toList());
      }
      statusRequest=StatusRequest.none;
      update();
    }
    update();
  }

  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsDetailsPage,
        arguments: {'itemsModel': itemsModel});
  }

  @override
  void onInit() {
    fetchOffersProducts();
    super.onInit();
  }
}
