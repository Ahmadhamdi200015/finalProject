import 'package:get/get.dart';
import 'package:iug/core/constant/route.dart';
import 'package:iug/core/function/staterequest.dart';
import 'package:iug/data/datasource/remote/orders/pending_data.dart';
import 'package:iug/data/model/myOrders.dart';

import '../../core/services/service.dart';

class OrderController extends GetxController {
  List<MyOrder> listOrders = [];
  MyService myService = Get.find();
  PendingData pendingData = PendingData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  String? typeOrder;
  String? methodOrder;
  String? addressOrder;

  String printTypeOrder(val) {
    if (val.toString() == "0") {
      return "delivery";
    } else {
      return "receive";
    }
  }

  String printMethodOrder(val) {
    if (val.toString() == "0") {
      return "cash";
    } else {
      return "Card";
    }
  }

  String printStatusOrder(val) {
    if (val.toString() == "0") {
      return "Pending Approval";
    } else if (val.toString() == "1") {
      return "order is being prepared  ";
    } else if (val.toString() == "2") {
      return "waiting to picked up by delivery man ";
    } else if (val.toString() == "3") {
      return "order on a way ";
    } else {
      return "Archive";
    }
  }

  fetchOrder() async {
    print('=====================');
    statusRequest = StatusRequest.lodaing;
    update();
    try {
      var response = await pendingData.getPending();
      if (response is List) {
        if (response.isNotEmpty) {
          listOrders.addAll(
              response.map<MyOrder>((e) => MyOrder.fromJson(e)).toList());
          print("order Response is $response");
        }
      }
    } catch (e) {
      print(e);
      update();
    }
    update();
  }


  goToDetailsPage(MyOrder myOrderModel, int orderId) {
    Get.toNamed(AppRoute.orderDetails, arguments: {
      "myOrders": myOrderModel,
      "orderId": orderId
    });
  }


  @override
  void onInit() {
    fetchOrder();
    super.onInit();
  }
}
