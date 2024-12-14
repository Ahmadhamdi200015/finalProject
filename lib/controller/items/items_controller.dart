import 'package:get/get.dart';

class ItemsController extends GetxController{


  int selectedItems=0;

changeItemSelected(val){
  selectedItems=val;
  update();
}

@override
  void onInit() {
    super.onInit();
  }
}