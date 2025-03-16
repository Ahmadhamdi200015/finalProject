import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class CheckOutData {
  final Crud crud;

  CheckOutData(this.crud);

  Future<dynamic> addOrder(addressId,paymentMethod, isDelivery,deliveryPrice ) async {
    var response = await crud.dataPost(AppLink.checkOut, {
      "address_id": addressId,
      "payment_method": paymentMethod,
      "is_home_delivery": isDelivery,
      "delivery_price":deliveryPrice,
    });
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }
}
