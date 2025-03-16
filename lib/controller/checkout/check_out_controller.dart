import 'package:get/get.dart';
import 'package:iug/controller/address/shipping_address_controller.dart';
import 'package:iug/core/constant/route.dart';
import 'package:iug/core/function/staterequest.dart';
import 'package:iug/data/datasource/remote/address/address_data.dart';
import 'package:iug/data/datasource/remote/checkout/check_out_data.dart';
import 'package:iug/data/model/addressmodel.dart';

import '../../core/stripe_payment/payment_manger.dart';

class CheckOutController extends GetxController {

  List<MyAddressModel>addressList=[];
  int? shippingAddress;
  String? shippingAddressLabel;
  String? shippingAddressCity;
  String? shippingAddressStreet;

  AddressData addressData=AddressData(Get.find());

  late num orderPrice;

  String checkType = '0';
  StatusRequest statusRequest = StatusRequest.none;
  CheckOutData checkOutData = CheckOutData(Get.find());



  goToShippingPage() async {
    var result = await Get.toNamed(AppRoute.changeAddressPage);

    if (result == null) {
      // إذا لم يعد المستخدم بأي بيانات، لا تفعل شيء
      return;
    }

    if (result is Map<String, dynamic> && result.containsKey('id')) {
      shippingAddress = result['id'] ?? shippingAddress;
      shippingAddressLabel = result['name'] ?? shippingAddressLabel;
      shippingAddressCity = result['city'] ?? shippingAddressCity;
      shippingAddressStreet = result['street'] ?? shippingAddressStreet;
    }

    update();
  }


  // متغير لتخزين القيمة المختارة
  var selectedValue = 0;

  // دالة لتغيير القيمة
  void changeValue(value) {
    selectedValue = value;
    update();
  }


  chooseType(val) {
    checkType = val;
    update();
  }

  getAddress() async {
    addressList.clear();
    statusRequest = StatusRequest.lodaing;
    update();

    var response = await addressData.getAddress();

    if (response is List) {
      addressList.addAll(response.map((e) => MyAddressModel.fromJson(e)));
    }

    statusRequest = StatusRequest.none;
    update();
  }



  Future<void> addOrders() async {
    statusRequest = StatusRequest.lodaing;
    update();

    // في حالة الدفع عبر Stripe
    if (selectedValue == 1) {
      await PaymentManger.makePayment(orderPrice.toInt(), "USD");
    }

    var response = await checkOutData.addOrder(
      shippingAddress,
        selectedValue,
      checkType,
      10.0,

    );

      Get.snackbar('Success', 'CheckOut Process is Done');
      await Get.offAllNamed(AppRoute.homeScreen);

  }

  @override
  void onInit()async {
   await getAddress();
    orderPrice=Get.arguments['orderPrice'];
    if (addressList.length == 1) {
      // إرجاع العنوان الوحيد تلقائيًا إلى صفحة الـ Checkout
      Get.back(result: {
        "id": addressList[0].AddressId,
        "name": addressList[0].AddressName,
        "city": addressList[0].AddressCity,
        "street": addressList[0].AddressStreet,
      });
    }
    super.onInit();
  }
}
