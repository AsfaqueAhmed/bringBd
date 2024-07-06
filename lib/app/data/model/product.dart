
import 'package:bring_me_bd/app/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({required super.id, required super.sku, required super.name, required super.description, required super.urlKey, required super.images, required super.isNew, required super.isFeatured, required super.onSale, required super.isSaleable, required super.minPrice, required super.regularPrice, required super.avgRatings});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      sku: json['sku'],
      name: json['name'],
      description: json['description'],
      urlKey: json['url_key'],
      images: List<String>.from(json['images'].map((image) => image['original_image_url'])),
      isNew: json['is_new'],
      isFeatured: json['is_featured'],
      onSale: json['on_sale'],
      isSaleable: json['is_saleable'],
      minPrice: json['min_price'].toDouble(),
      regularPrice: json['prices']['regular']['price'].toDouble(),
      avgRatings: json['avg_ratings'].toDouble(),
    );
  }

}
