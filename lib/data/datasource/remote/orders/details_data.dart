
import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class DetailsData {
  final Crud crud;

  DetailsData(this.crud);

  Future<dynamic> getDetails(int orderId) async {
    var response = await crud.dataGet(AppLink.detailsOrder(orderId),{});
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }
}