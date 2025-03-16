import 'dart:ffi';

import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class AddressData {
  final Crud crud;

  AddressData(this.crud);

  Future<dynamic> addAddress(
    String city,
    String street,
    String name,
    double lat,
    double long,
  ) async {
    var response = await crud.dataPost(AppLink.addAddress, {
      "address": city,
      "streetname": street,
      "label": name,
      "latitude": lat,
      "longitude": long,
    });
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> getAddress() async {
    var response = await crud.dataGet(AppLink.viewAddress, {});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> updateAddress(
    int addressId,
    String name,
    String city,
    Float lat,
    Float long,
    String street,
  ) async {
    var response = await crud.dataPost(AppLink.updateAddress(addressId), {
      "address": city,
      "label": name,
      "latitude": lat,
      "longitude": long,
      "streetname": street,
    });
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> removeAddress(
    int addressId,
  ) async {
    var response = await crud.deleteData(AppLink.removeAddress(addressId), {});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }
}
