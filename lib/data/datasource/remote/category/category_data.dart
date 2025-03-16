

import '../../../../../applink.dart';
import '../../../../../core/class/crud.dart';

class CategoryData {
  final Crud crud;

  CategoryData(this.crud);
  Future<dynamic> getData() async {

    var response = await crud.dataGet(AppLink.catView, {});
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }

  Future<dynamic> getCatId(int id) async {

    var response = await crud.dataGet(AppLink.catViewId(id), {});
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }
}
