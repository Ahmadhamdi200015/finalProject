import 'package:get/get.dart';
import 'package:iug/controller/address/shipping_address_controller.dart';
import 'package:iug/core/constant/route.dart';

class CheckOutController extends GetxController{
  String? shippingAddress;
  String checkType ='0';



 String changeAddress(){
    ShippingAddressController controller=Get.put(ShippingAddressController());
    shippingAddress= controller.selectedValue;
    update();
    return shippingAddress!;
  }

  // متغير لتخزين القيمة المختارة
  var selectedValue = 0;

  // دالة لتغيير القيمة
  void changeValue(value) {
    selectedValue=value;
    update();
  }

  goToShippingPage(){
    Get.toNamed(AppRoute.changeAddressPage);
  }


  chooseType(val) {
    checkType = val;
    update();
  }
  @override
  void onInit() {
    super.onInit();
  }
}