import 'package:get/get.dart';
import 'package:iug/data/model/myOrders.dart';

import '../../core/function/staterequest.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/orders/details_data.dart';
import '../../data/model/orderDetails.dart';

class DetailsOrderController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late OrderDetails orderDetails;
  int? orderId;
  MyOrder orderModel =MyOrder();
  DetailsData detailsData = DetailsData(Get.find());
  List<OrderDetail> detailsList = [];
  MyService myService = Get.find();

  @override
  void onInit() {
    InitData();
    getOrders();
    super.onInit();
  }

  InitData() async {
    orderModel = Get.arguments['myOrders'];
    orderId = Get.arguments['orderId'];
    update();
  }

  getOrders() async {
    statusRequest = StatusRequest.lodaing;
    update();

    var response = await detailsData.getDetails(orderId!);

    if (response is Map<String, dynamic>) {
      if (response.containsKey('order_details') && response['order_details'] is List) {
        print('object');
        detailsList.addAll(response['order_details'].map<OrderDetail>((e)=>OrderDetail.fromJson(e)).toList());
        print('tow');
        statusRequest=StatusRequest.none;
        update();
      } else {
        print("Error: 'order_details' key not found or not a list -> $response");
      }
    } else {
      print("Error: Response is not a Map -> $response");
    }

    update();
  }

}
