import 'package:get/get.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/core/function/staterequest.dart';
import 'package:gazaStore/data/datasource/remote/category/category_data.dart';
import 'package:gazaStore/data/datasource/remote/products/products_data.dart';
import 'package:gazaStore/data/model/categorymodel.dart';
import 'package:gazaStore/data/model/itemsmodel.dart';

class ItemsController extends GetxController {
  int selectedItems = 0;
  late int categoryId;
  late int selectedCat;
  CategoryData categoryData = CategoryData(Get.find());
  ProductsData productsData = ProductsData(Get.find());
  List<ItemsModel> productsList = [];
  List<ItemsModel> productsOffers = [];

  List category = [];
  late Categorymodel categoryModel;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  initData() {
    category = Get.arguments['categories'];
    categoryId = Get.arguments['catId'];
    selectedCat = Get.arguments['selectedCat'];
    fetchProducts(categoryId);
  }

  changeCat(val, catVal) {
    selectedCat = val;
    categoryId = catVal;
    fetchProducts(categoryId);
    update();
  }

  fetchProducts(int categoriesId) async {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await productsData.fetchProducts(categoriesId);
      if (response is List) {
        productsList.addAll(
            response.map<ItemsModel>((e) => ItemsModel.fromJson(e)).toList());
        print('products is =============$productsList');
        statusRequest=StatusRequest.none;
        update();
      } else {
        throw Exception(
            "Invalid response format: Expected List but got ${response.runtimeType}");
      }
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

  fetchOffersProducts(int categoriesId) async {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await productsData.getData();
      if (response is List) {
        productsOffers.addAll(
            response.map<ItemsModel>((e) => ItemsModel.fromJson(e)).toList());
      } else {
        throw Exception(
            "Invalid response format: Expected List but got ${response.runtimeType}");
      }
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

  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsDetailsPage,
        arguments: {'itemsModel': itemsModel});
  }
}
