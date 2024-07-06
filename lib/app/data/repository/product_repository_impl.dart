import 'package:bring_me_bd/app/core/constents/endpoints.dart';
import 'package:bring_me_bd/app/data/dto_models/product_details_response.dart';
import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:bring_me_bd/app/domain/repossitory/product_repository.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImpl extends ProductRepository {
  final Dio _dio;

  ProductRepositoryImpl(this._dio);

  @override
  Future<ProductListResponse> getFeaturedProducts() async {
    final response = await _dio.get(
      ApiEndPoints.featuredProducts,
    );

    return ProductListResponse.fromJson(response.data);
  }

  @override
  Future<ProductListResponse> getNewProducts() async {
    final response = await _dio.get(
      ApiEndPoints.newProducts,
    );

    return ProductListResponse.fromJson(response.data);
  }

  @override
  Future<ProductListResponse> getProducts() async {
    final response = await _dio.get(
      ApiEndPoints.products,
    );

    return ProductListResponse.fromJson(response.data);
  }

  @override
  Future<ProductDetailsResponse?> getProductDetails(dynamic id) async {
    final response = await _dio.get(
      ApiEndPoints.productsDetails(id),
    );

    return ProductDetailsResponse.fromJson(response.data);
  }

  @override
  Future<ProductListResponse> getRelatedProducts(num? id) async {
    final response = await _dio.get(
      ApiEndPoints.relatedProducts(id),
    );

    return ProductListResponse.fromJson(response.data);
  }

  @override
  Future<ProductListResponse> getProductsByCategory(num? id) async {
    final response = await _dio.get(
      ApiEndPoints.productsById(id),
    );

    return ProductListResponse.fromJson(response.data);
  }
}
