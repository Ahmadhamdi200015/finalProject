import 'package:get/get.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/core/services/service.dart';

class ProfileController extends GetxController {
  MyService myService = Get.find();
  String userName='';

  String getName() {
    return userName = myService.sharedPrefrences.getString('userName')!;
  }


  goToAboutPage() {
    Get.toNamed(AppRoute.aboutPage);
  }

  goToPasswordPage() {
    Get.toNamed(AppRoute.changePasswordPage);
  }

  goToArchivePage() {
    Get.toNamed(AppRoute.archivePage);
  }

  goToAddressPage() {
    Get.toNamed(AppRoute.addressView);
  }
  logOut()async{
    await myService.sharedPrefrences.remove('userId');
    Get.offAllNamed(AppRoute.login);
  }
}
