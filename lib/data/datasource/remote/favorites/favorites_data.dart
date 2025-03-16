import 'dart:ffi';

import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class FavoritesData {
  final Crud crud;

  FavoritesData(this.crud);

  Future<dynamic> addFav(
      int productId
      ) async {
    var response = await crud.dataPost(AppLink.addFav, {
      "product_id": productId,

    });
    return response.fold(
            (l) => l, // Handle the left side of the result (typically an error)
            (r) => r // Handle the right side of the result (typically the data)
    );
  }

  Future<dynamic> getFav(
      ) async {
    var response = await crud.dataPost(AppLink.favView, {});
    return response.fold(
            (l) => l, // Handle the left side of the result (typically an error)
            (r) => r // Handle the right side of the result (typically the data)
    );
  }

  Future<dynamic> removeFav(
      int favId,
      ) async {
    var response = await crud.deleteData(AppLink.removeFav(favId), {});
    return response.fold(
            (l) => l, // Handle the left side of the result (typically an error)
            (r) => r // Handle the right side of the result (typically the data)
    );
  }
}
