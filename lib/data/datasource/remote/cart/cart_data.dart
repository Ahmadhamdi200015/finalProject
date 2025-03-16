import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class CartData {
  final Crud crud;

  CartData(this.crud);

  Future<dynamic> addCart(int productId, int quantity) async {
    var response = await crud.dataPost(
        AppLink.cartAdd, {"product_id": productId, "quantity": quantity});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> deleteCart(int itemsId) async {
    var response = await crud.deleteData(AppLink.cartDelete(itemsId), {});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> updateCart(int cartId, int quantity) async {
    var response = await crud
        .updateData(AppLink.cartUpdate(cartId), {"quantity": quantity});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> viewCart() async {
    var response = await crud.dataGet(AppLink.cartView, {});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }
}
