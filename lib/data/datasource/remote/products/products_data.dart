

import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class ProductsData {
  final Crud crud;

  ProductsData(this.crud);
  Future<dynamic> getData() async {

    var response = await crud.dataGet(AppLink.productsView, {});
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }


  Future<dynamic> fetchProducts(int categoriesId) async {

    var response = await crud.dataGet(AppLink.productsCond(categoriesId),{});
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }
  Future<dynamic> fetchProductsDiscount() async {

    var response = await crud.dataGet(AppLink.productsDis,{});
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }
}
