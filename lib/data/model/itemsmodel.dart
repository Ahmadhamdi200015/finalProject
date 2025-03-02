class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  int? itemsCount;
  String? itemsPrice;
  String? itemsBrand;
  String? itemsDiscount;
  int? itemsCat;

  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsDesc,
        this.itemsImage,
        this.itemsCount,
        this.itemsPrice,
        this.itemsBrand,
        this.itemsDiscount,
        this.itemsCat,
      });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['id'];
    itemsName = json['name'];
    itemsDesc = json['description'];
    itemsImage = json['product_image'];
    itemsCount = json['stock_quantity'];
    itemsPrice = json['price'];
    itemsBrand=json['brand'];
    itemsDiscount = json['discount'];
    itemsCat = json['category_id'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = itemsId;
    data['name'] = itemsName;
    data['description'] = itemsDesc;
    data['product_image'] = itemsImage;
    data['stock_quantity'] = itemsCount;
    data['price'] = itemsPrice;
    data['brand'] = itemsBrand;
    data['discount'] = itemsDiscount;
    data['category_id'] = itemsCat;


    return data;
  }
}