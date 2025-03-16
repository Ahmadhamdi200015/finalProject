class MyOrder {
  int? id;
  int? userId;
  int? addressId;
  String? orderDate;
  String? totalAmount;
  String? status;
  String? deliveryAddress;
  int? isHomeDelivery;
  String? deliveryPrice;
  int? paymentMethod;
  String? createdAt;
  String? updatedAt;

  MyOrder(
      {this.id,
        this.userId,
        this.addressId,
        this.orderDate,
        this.totalAmount,
        this.status,
        this.deliveryAddress,
        this.isHomeDelivery,
        this.deliveryPrice,
        this.paymentMethod,
        this.createdAt,
        this.updatedAt});

  MyOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    orderDate = json['order_date'];
    totalAmount = json['total_amount'];
    status = json['status'];
    deliveryAddress = json['delivery_address'];
    isHomeDelivery = json['is_home_delivery'];
    deliveryPrice = json['delivery_price'];
    paymentMethod = json['payment_method'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address_id'] = this.addressId;
    data['order_date'] = this.orderDate;
    data['total_amount'] = this.totalAmount;
    data['status'] = this.status;
    data['delivery_address'] = this.deliveryAddress;
    data['is_home_delivery'] = this.isHomeDelivery;
    data['delivery_price'] = this.deliveryPrice;
    data['payment_method'] = this.paymentMethod;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}