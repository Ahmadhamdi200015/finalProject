import 'dart:ui';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../core/function/fcmconfig.dart';
import '../../core/services/service.dart';

class LocalController extends GetxController {
  MyService myService = Get.find();



  getRequestPermission()async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Warning", "Location services are disabled");
      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Warning", "Location permissions are denied");
        // return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Warning", "Location permissions are permanently denied, we cannot request permissions.");
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  void onInit() {
    RequestPermissoinNotification();
    getRequestPermission();
    super.onInit();
  }
}