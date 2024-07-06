import 'package:bring_me_bd/app/data/dto_models/product_details_response.dart';
import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';

abstract class ProductRepository {
  Future<ProductListResponse> getNewProducts();

  Future<ProductListResponse> getFeaturedProducts();

  Future<ProductListResponse> getProducts();

  Future<ProductDetailsResponse?> getProductDetails(dynamic id);

  Future<ProductListResponse> getRelatedProducts(num? id);

  Future<ProductListResponse> getProductsByCategory(num? id);
}
