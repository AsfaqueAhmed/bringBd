import 'package:bring_me_bd/app/core/constents/endpoints.dart';
import 'package:bring_me_bd/app/data/dto_models/category_list_response.dart';
import 'package:bring_me_bd/app/domain/repossitory/category_repository.dart';
import 'package:dio/dio.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final Dio _dio;

  CategoryRepositoryImpl(this._dio);

  @override
  Future<CategoryListResponse?> getAllCategories() async {
    final response = await _dio.get(
      ApiEndPoints.categories,
    );

    return CategoryListResponse.fromJson(response.data);
  }
}
