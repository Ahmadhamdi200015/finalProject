class ItemsModel {
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

  ItemsModel(
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

  ItemsModel.fromJson(Map<String, dynamic> json) {
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