class OrderDetails {
  int? id;
  int? userId;
  int? addressId;
  String? orderDate;
  String? totalAmount;
  String? status;
  Null? deliveryAddress;
  int? isHomeDelivery;
  String? deliveryPrice;
  int? paymentMethod;
  String? createdAt;
  String? updatedAt;
  List<OrderDetail>? orderDetail;

  OrderDetails(
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
        this.updatedAt,
        this.orderDetail});

  OrderDetails.fromJson(Map<String, dynamic> json) {
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
    if (json['order_details'] != null) {
      orderDetail = <OrderDetail>[];
      json['order_details'].forEach((v) {
        orderDetail!.add(new OrderDetail.fromJson(v));
      });
    }
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
    if (this.orderDetail != null) {
      data['order_details'] =
          this.orderDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetail {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  String? price;
  String? createdAt;
  String? updatedAt;
  Product? product;

  OrderDetail(
      {this.id,
        this.orderId,
        this.productId,
        this.quantity,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.product});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? brand;
  String? price;
  String? priceAfterDiscount;
  String? discount;
  String? productImage;
  int? stockQuantity;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
        this.name,
        this.description,
        this.brand,
        this.price,
        this.priceAfterDiscount,
        this.discount,
        this.productImage,
        this.stockQuantity,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    brand = json['brand'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    discount = json['discount'];
    productImage = json['product_image'];
    stockQuantity = json['stock_quantity'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['brand'] = this.brand;
    data['price'] = this.price;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['discount'] = this.discount;
    data['product_image'] = this.productImage;
    data['stock_quantity'] = this.stockQuantity;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}