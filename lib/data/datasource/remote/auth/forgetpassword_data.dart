

import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class ForgetPasswordData {
  Crud crud;

  ForgetPasswordData(this.crud);

  postData(String email) async {
    var payload = {
      "email": email,
    };

    var response = await crud.dataPost(AppLink.forgetPassword, payload);
    return response.fold((l) => l, (r) => r);
  }
}
