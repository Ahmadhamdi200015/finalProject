import 'package:get/get.dart';
import 'package:iug/controller/checkout/check_out_controller.dart';

import '../../core/constant/route.dart';
import '../../core/function/staterequest.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/address/address_data.dart';
import '../../data/model/addressmodel.dart';

class ShippingAddressController extends GetxController{

  List<MyAddressModel> data = [];

  //
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();

  // متغير لتخزين القيمة المختارة
  String selectedValue='Home';

  // دالة لتغيير القيمة
  void changeValue(value) {
    selectedValue=value;
    CheckOutController controller=Get.put(CheckOutController());
    controller.changeAddress();
    update();

  }




  @override
  void onInit() {
    getAddress();
    super.onInit();
  }

  goToAddAddress() {
    Get.toNamed(AppRoute.mapAddressPage);
  }

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