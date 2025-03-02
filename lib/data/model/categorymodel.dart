class Categorymodel {
  int? catId;
  String? catName;
  String? catImage;

  Categorymodel(
      {this.catId,
        this.catName,
        this.catImage,
      });

  Categorymodel.fromJson(Map<String, dynamic> json) {
    catId = json['id'];
    catName = json['name'];
    catImage = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = catId;
    data['name'] = catName;
    data['product_image'] = catImage;

    return data;
  }
}