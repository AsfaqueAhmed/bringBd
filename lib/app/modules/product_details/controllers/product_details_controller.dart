import 'package:bring_me_bd/app/data/dto_models/product_details_response.dart';
import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:bring_me_bd/app/data/repository/product_repository_impl.dart';
import 'package:bring_me_bd/app/domain/repossitory/product_repository.dart';
import 'package:bring_me_bd/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  Product productModel = Get.arguments;
  Rx<ProductDetailsResponse?> response = Rx(null);
  Rx<ProductListResponse?> relatedProducts = Rx(null);

  PageController pageController = PageController();
  ProductRepository productRepository = Get.find<ProductRepositoryImpl>();

  bool get isInWishList =>
      Get.find<HomeController>().isInWishList(productModel.id);

  @override
  void onInit() async {
    super.onInit();
    response.value = await productRepository.getProductDetails(productModel.id);
    relatedProducts.value =
        await productRepository.getRelatedProducts(productModel.id);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void addToWishList() {
    Get.find<HomeController>().addToWishList(productModel);
  }
}
