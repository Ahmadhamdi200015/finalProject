import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/core/function/staterequest.dart';
import 'package:gazaStore/core/services/service.dart';
import 'package:gazaStore/data/datasource/remote/category/category_data.dart';
import 'package:gazaStore/data/datasource/remote/products/products_data.dart';
import 'package:gazaStore/data/model/categorymodel.dart';
import 'package:gazaStore/data/model/itemsmodel.dart';

class HomePageController extends GetxController {
  ProductsData productsData = ProductsData(Get.find());
  CategoryData categoryData = CategoryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> products = [];
  List<Categorymodel> categories = [];
  MyService myService = Get.find();

  Future<void> fetchCategories() async {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      print('Sending Categories request...');
      var response = await categoryData.getData();

      // التأكد من أن response هو List
      if (response is List) {
        categories.addAll(response
            .map<Categorymodel>((e) => Categorymodel.fromJson(e))
            .toList());
      } else {
        throw Exception(
            "Invalid response format: Expected List categories but got ${response.runtimeType}");
      }

      statusRequest = StatusRequest.none;
    } catch (e) {
      statusRequest = StatusRequest.none;
      print('ExceptionForProducts: $e');
      Get.defaultDialog(
        title: "Error",
        middleText: "An unexpected error occurred.",
      );
    }
    update();
  }

  Future<void> fetchProducts() async {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      print('Sending products request...');
      var response = await productsData.getData();

      // التأكد من أن response هو List
      if (response is List) {
        products.addAll(
            response.map<ItemsModel>((e) => ItemsModel.fromJson(e)).toList());
        statusRequest=StatusRequest.none;
        update();
      } else {
        throw Exception(
            "Invalid response format: Expected List products but got ${response.runtimeType}");
      }

    } catch (e) {
      statusRequest = StatusRequest.none;
      update();
      print('ExceptionForProducts: $e');
      Get.defaultDialog(
        title: "Error",
        middleText: "An unexpected error occurred.",
      );
    }
    update();
  }

  gotoItemsView(List categories, int selectedCat, int catId) {
    Get.toNamed(AppRoute.itemsPage, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catId": catId,
    });
  }

  goToItemsDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsDetailsPage,
        arguments: {'itemsModel': itemsModel});
  }

  @override
  void onInit() async {
    await fetchCategories();
    await fetchProducts();
    super.onInit();
  }
}
