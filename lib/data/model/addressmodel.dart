import 'dart:ffi';

class MyAddressModel {
  int? AddressId;
  String? AddressName;
  String? AddressCity;
  String? AddressStreet;
  String? AddressLat;
  String? AddressLong;


  MyAddressModel(
      {this.AddressId,
        this.AddressName,
        this.AddressCity,
        this.AddressStreet,
        this.AddressLat,
        this.AddressLong,
        });

  MyAddressModel.fromJson(Map<String, dynamic> json) {
    AddressId = json['id'];
    AddressName = json['label'];
    AddressCity = json['address'];
    AddressStreet = json['streetname'];
    AddressLat = json['latitude'];
    AddressLong = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = AddressId;
    data['label'] = AddressName;
    data['address'] = AddressCity;
    data['streetname'] = AddressStreet;
    data['latitude'] = AddressLat;
    data['longitude'] = AddressLong;

    return data;
  }
}