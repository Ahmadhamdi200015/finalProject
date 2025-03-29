import 'package:get/get.dart';
import 'package:gazaStore/controller/address/shipping_address_controller.dart';
import 'package:gazaStore/core/constant/route.dart';
import 'package:gazaStore/core/function/staterequest.dart';
import 'package:gazaStore/data/datasource/remote/address/address_data.dart';
import 'package:gazaStore/data/datasource/remote/checkout/check_out_data.dart';
import 'package:gazaStore/data/model/addressmodel.dart';

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
      if(addressList.isNotEmpty){
          shippingAddress = addressList.first.AddressId ;
          shippingAddressLabel = addressList.first.AddressName ;
          shippingAddressCity = addressList.first.AddressCity;
          shippingAddressStreet = addressList.first.AddressStreet ;

      }

    }

    statusRequest = StatusRequest.none;
    update();
  }



  addOrders() async {
    if ((shippingAddressCity ?? '').isEmpty) {
      return Get.snackbar('Warning', 'Firstly Add Address');
    }

    statusRequest = StatusRequest.lodaing;
    update();

    try {
      // في حالة الدفع عبر Stripe
      if (selectedValue == 1) {
        bool paymentSuccess = await PaymentManger.makePayment(orderPrice.toInt(), "USD");
        if (!paymentSuccess) {
          statusRequest = StatusRequest.failure;
          update();
          return Get.snackbar('Error', 'Payment Failed');
        }
      }

      var response = await checkOutData.addOrder(
        shippingAddress ,
        selectedValue ?? 0,
        checkType ,
        10.0,
      );

        Get.snackbar('Success', 'CheckOut Process is Done');
        await Get.offAllNamed(AppRoute.homeScreen);

    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      statusRequest = StatusRequest.success;
      update();
    }
  }


  @override
  void onInit()async {
    orderPrice=Get.arguments['orderPrice'];

    await getAddress();
    super.onInit();
  }
}
