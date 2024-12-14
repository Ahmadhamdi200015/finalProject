import 'package:get/get.dart';
import 'package:iug/controller/checkout/check_out_controller.dart';

class ShippingAddressController extends GetxController{

  // متغير لتخزين القيمة المختارة
  String selectedValue='Home';

  // دالة لتغيير القيمة
  void changeValue(value) {
    selectedValue=value;
    CheckOutController controller=Get.put(CheckOutController());
    controller.changeAddress();
    update();

  }
}