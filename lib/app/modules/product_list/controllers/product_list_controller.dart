import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:bring_me_bd/app/data/model/category_model.dart';
import 'package:bring_me_bd/app/data/repository/product_repository_impl.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  Rx<ProductListResponse?> products = Rx(null);
  CategoryModel categoryModel = Get.arguments;
  ProductRepositoryImpl productRepositoryImpl =
      Get.find<ProductRepositoryImpl>();

  @override
  void onInit() {
    _loadProducts();
    super.onInit();
  }

  void _loadProducts() async {
    try {
      products.value = await productRepositoryImpl.getProductsByCategory(categoryModel.id);
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
    }
  }
}
