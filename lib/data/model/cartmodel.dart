// class cartItems {
//   int? id;
//   int? userId;
//   int? productId;
//   int? quantity;
//   String? createdAt;
//   String? updatedAt;
//   List<Items>? items;
//
//   cartItems(
//       {this.id,
//         this.userId,
//         this.productId,
//         this.quantity,
//         this.createdAt,
//         this.updatedAt,
//         this.items});
//
//   cartItems.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     productId = json['product_id'];
//     quantity = json['quantity'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['items'] != null) {
//       items = <Items>[];
//       json['items'].forEach((v) {
//         items!.add(new Items.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['product_id'] = this.productId;
//     data['quantity'] = this.quantity;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.items != null) {
//       data['items'] = this.items!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Items {
//   int? id;
//   int? cartId;
//   int? productId;
//   int? quantity;
//   String? createdAt;
//   String? updatedAt;
//   Product? product;
//
//   Items(
//       {this.id,
//         this.cartId,
//         this.productId,
//         this.quantity,
//         this.createdAt,
//         this.updatedAt,
//         this.product});
//
//   Items.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     cartId = json['cart_id'];
//     productId = json['product_id'];
//     quantity = json['quantity'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     product =
//     json['product'] != null ? new Product.fromJson(json['product']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['cart_id'] = this.cartId;
//     data['product_id'] = this.productId;
//     data['quantity'] = this.quantity;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.product != null) {
//       data['product'] = this.product!.toJson();
//     }
//     return data;
//   }
// }
//
// class Product {
//   int? id;
//   String? name;
//   String? description;
//   String? brand;
//   String? price;
//   String? priceAfterDiscount;
//   String? discount;
//   String? productImage;
//   int? stockQuantity;
//   int? categoryId;
//   String? createdAt;
//   String? updatedAt;
//
//   Product(
//       {this.id,
//         this.name,
//         this.description,
//         this.brand,
//         this.price,
//         this.priceAfterDiscount,
//         this.discount,
//         this.productImage,
//         this.stockQuantity,
//         this.categoryId,
//         this.createdAt,
//         this.updatedAt});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     brand = json['brand'];
//     price = json['price'];
//     priceAfterDiscount = json['price_after_discount'];
//     discount = json['discount'];
//     productImage = json['product_image'];
//     stockQuantity = json['stock_quantity'];
//     categoryId = json['category_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['brand'] = this.brand;
//     data['price'] = this.price;
//     data['price_after_discount'] = this.priceAfterDiscount;
//     data['discount'] = this.discount;
//     data['product_image'] = this.productImage;
//     data['stock_quantity'] = this.stockQuantity;
//     data['category_id'] = this.categoryId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }