import 'package:bring_me_bd/app/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      required super.sku,
      required super.name,
      required super.description,
      required super.urlKey,
      required super.images,
      required super.isNew,
      required super.isFeatured,
      required super.onSale,
      required super.isSaleable,
      required super.minPrice,
      required super.regularPrice,
      required super.avgRatings});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      sku: json['sku'],
      name: json['name'],
      description: json['description'],
      urlKey: json['url_key'],
      images: List<String>.from(
          json['images'].map((image) => image['original_image_url'])),
      isNew: json['is_new'] ?? false,
      isFeatured: json['is_featured'] ?? false,
      onSale: json['on_sale'] ?? false,
      isSaleable: json['is_saleable'] ?? false,
      minPrice: num.parse(json['min_price']?.toString() ?? "0"),
      regularPrice:
          num.parse(json['prices']?['regular']?['price']?.toString() ?? "0"),
      avgRatings: num.parse(json['avg_ratings']??"0"),
    );
  }
}
