import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';
import 'package:iug/core/services/service.dart';

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
    await myService.sharedPrefrences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
