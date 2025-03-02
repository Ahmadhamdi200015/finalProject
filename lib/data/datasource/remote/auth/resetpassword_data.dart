

import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);
  getToken(){

  }

  postData(String email,String password,String passwordConfirmation) async {
    String? token=await crud.getToken();
    print(token);
    var payload = {
      "token":'15|C3RMUwQcuYQanQgAXKR04GBGdzC4oYlUbEyVpTeid50b131c',
      "email": email,
      "password": password,
      "password_confirmation":passwordConfirmation,
    };

    var response = await crud.dataPost(AppLink.resetPassword, payload);
    return response.fold((l) => l, (r) => r);
  }
}
