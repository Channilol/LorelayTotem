class ProductItem {
  String productId;
  String name;
  String description;
  String categoryId;
  String? image;
  num price;

  List<ProductExtraItem>? extras = [];

  ProductItem(
      {required this.productId,
      required this.name,
      required this.description,
      required this.categoryId,
      required this.price,
      required this.image,
      this.extras});

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      productId: json['productId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      categoryId: json['categoryId'] as String,
      price: json['price'] as num,
      image: json['image'] as String?,
      extras: (json['extras'] as List<dynamic>?)
          ?.map((e) => ProductExtraItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['description'] = description;
    data['categoryId'] = categoryId;
    data['price'] = price;
    data['image'] = image;
    data['extras'] = extras?.map((e) => e.toJson()).toList();
    return data;
  }
}

class ProductExtraItem {
  String extraId;
  int? order;

  ProductExtraItem({required this.extraId, this.order});

  factory ProductExtraItem.fromJson(Map<String, dynamic> json) {
    return ProductExtraItem(
      extraId: json['extraId'] as String,
      order: json['order'] != null ? int.parse(json['order'].toString()) : 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extraId'] = extraId;
    data['order'] = order;
    return data;
  }
}
