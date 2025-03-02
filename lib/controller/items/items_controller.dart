import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';
import 'package:iug/core/function/staterequest.dart';
import 'package:iug/data/datasource/remote/products/products_data.dart';
import 'package:iug/data/model/categorymodel.dart';
import 'package:iug/data/model/itemsmodel.dart';

class ItemsController extends GetxController {
  int selectedItems = 0;
  late int categoryId;
  late int selectedCat;
  ProductsData productsData = ProductsData(Get.find());
  List<ItemsModel> productsList = [];
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
goToProductDetails(ItemsModel itemsModel){
    Get.toNamed(AppRoute.itemsDetailsPage,arguments: {
      'itemsModel':itemsModel
    });
}
}
