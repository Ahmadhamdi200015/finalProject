
import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class CheckEmailData {
  final Crud crud;

  CheckEmailData(this.crud);

  Future postData(String email) async {

    // Construct the request payload
    var payload = {
      "email": email,
    };

    // Make the POST request
    var response = await crud.dataPost(AppLink.checkEmail, payload);

    // Handle the response based on result type
    return response.fold(
            (l) => l, // Handle error
            (r) => r  // Handle success
    );

  }
}
