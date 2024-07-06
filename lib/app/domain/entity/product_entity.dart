
class ProductEntity {
  final int id;
  final String sku;
  final String name;
  final String description;
  final String urlKey;
  final List<String> images;
  final bool isNew;
  final bool isFeatured;
  final bool onSale;
  final bool isSaleable;
  final double minPrice;
  final double regularPrice;
  final double avgRatings;

  ProductEntity({
    required this.id,
    required this.sku,
    required this.name,
    required this.description,
    required this.urlKey,
    required this.images,
    required this.isNew,
    required this.isFeatured,
    required this.onSale,
    required this.isSaleable,
    required this.minPrice,
    required this.regularPrice,
    required this.avgRatings,
  });
}
