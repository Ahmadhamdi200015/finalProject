import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';

class HomePageController extends GetxController{

  goToItemsView(){
    Get.toNamed(AppRoute.itemsPage);
  }

  goToItemsDetails(){
    Get.toNamed(AppRoute.itemsDetailsPage);
  }

}