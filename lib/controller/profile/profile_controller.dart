import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';

class ProfileController extends GetxController{
  goToOrderPage(){
    Get.toNamed(AppRoute.orderPage);
  }
  goToAboutPage(){
    Get.toNamed(AppRoute.aboutPage);
  }

  goToPasswordPage(){
    Get.toNamed(AppRoute.changePasswordPage);
  }

  goToArchivePage(){
    Get.toNamed(AppRoute.archivePage);
  }
}