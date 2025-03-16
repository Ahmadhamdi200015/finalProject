import 'package:get/get.dart';
import 'package:iug/controller/checkout/check_out_controller.dart';

import '../../core/constant/route.dart';
import '../../core/function/staterequest.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/address/address_data.dart';
import '../../data/model/addressmodel.dart';

class ShippingAddressController extends GetxController {
  List<MyAddressModel> data = [];
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();

  // متغير لتخزين العنوان الافتراضي
  String? selectedValue;
  String? selectedCity;
  String? selectedStreet;
  int? selectedId;

  void changeValue(String value, String city, String street, int id) {
    selectedValue = value;
    selectedCity = city;
    selectedStreet = street;
    selectedId = id;

    if (Get.isOverlaysOpen || Get.isDialogOpen == true) {
      // إغلاق أي حوارات مفتوحة أولًا قبل العودة
      Get.back();
    }

    if (Get.currentRoute != "/") {
      // إرجاع البيانات للصفحة السابقة فقط إذا لم نكن بالفعل في الصفحة الرئيسية
      Get.back(result: {
        "name": value,
        "city": city,
        "street": street,
        "id": id,
      });
    }

    update();
  }


  @override
  void onInit() {
    super.onInit();
    getAddress();
  }

  goToAddAddress() {
    Get.toNamed(AppRoute.mapAddressPage);
  }

  // جلب العناوين وتعيين أول عنوان كافتراضي إذا كان موجودًا
  getAddress() async {
    data.clear();
    statusRequest = StatusRequest.lodaing;
    update();

    var response = await addressData.getAddress();

    if (response is List) {
      data.addAll(response.map((e) => MyAddressModel.fromJson(e)));

      // تعيين أول عنوان كافتراضي إذا كانت هناك بيانات
      if (data.isNotEmpty) {
        selectedValue = data.first.AddressName;
        selectedCity = data.first.AddressCity;
        selectedStreet = data.first.AddressStreet;
        selectedId = data.first.AddressId;
      }
    }

    statusRequest = StatusRequest.none;
    update();
  }

  removeAddress(int addressId) async {
    var response = await addressData.removeAddress(addressId);
    data.removeWhere((e) => e.AddressId == addressId);

    // إذا كان العنوان المحذوف هو العنوان الافتراضي، قم بتحديث العنوان الافتراضي الجديد
    if (selectedId == addressId && data.isNotEmpty) {
      selectedValue = data.first.AddressName;
      selectedCity = data.first.AddressCity;
      selectedStreet = data.first.AddressStreet;
      selectedId = data.first.AddressId;
    } else if (data.isEmpty) {
      selectedValue = null;
      selectedCity = null;
      selectedStreet = null;
      selectedId = null;
    }

    update();
  }
}
