import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../core/constant/route.dart';
import '../../core/function/handlingdata.dart';
import '../../core/function/staterequest.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/address/address_data.dart';
import '../../data/model/addressmodel.dart';
import '../../view/screen/home/home_srceen.dart';
import 'address_view_controller.dart';

class AddressController extends GetxController {
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? name;
  MyService myService = Get.find();

  String? lat;
  String? long;

  List<MyAddressModel> data = [];
  //
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  addAddress() async {
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await addressData.addAddress(
        "${myService.sharedPrefrences.getString("userid")}",
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!,
      );
        AddressViewControllerImp c = Get.find();
        c.getAddress();
        Get.toNamed(AppRoute.homeScreen);

    } catch (e) {
      print("============================$e");
      statusRequest = StatusRequest.serverfailure;
    }
    statusRequest=StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    city = TextEditingController();
    street = TextEditingController();
    name = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    super.onInit();
  }
}
