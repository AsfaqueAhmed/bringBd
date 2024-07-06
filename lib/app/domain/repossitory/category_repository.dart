import 'package:bring_me_bd/app/data/dto_models/category_list_response.dart';

abstract class CategoryRepository {
  Future<CategoryListResponse?> getAllCategories();
}
