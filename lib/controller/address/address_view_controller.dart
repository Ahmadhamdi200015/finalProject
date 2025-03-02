import 'package:get/get.dart';

import '../../core/constant/route.dart';
import '../../core/function/handlingdata.dart';
import '../../core/function/staterequest.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/address/address_data.dart';
import '../../data/model/addressmodel.dart';

abstract class AddressViewController extends GetxController {
  goToAddAddress();

getAddress();

removeAddress(String addressId);
}

class AddressViewControllerImp extends AddressViewController {
  List<MyAddressModel> data = [];

  //
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }

  @override
  goToAddAddress() {
    Get.toNamed(AppRoute.mapAddressPage);
  }

  @override
  getAddress() async {
    data.clear();
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await addressData.getAddress(
      "${myService.sharedPrefrences.getString("userid")}",
    );
    List responseList = response['data'];
    if (response is List) {
      data.addAll(responseList.map((e) => MyAddressModel.fromJson(e)));
    }

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  removeAddress(addressId) async {
    var response = await addressData.removeAddress(addressId.toString());
    data.removeWhere((e) => e.AddressId.toString() == addressId.toString());
    update();
  }
}
