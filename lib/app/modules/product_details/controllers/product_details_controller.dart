import 'package:bring_me_bd/app/data/dto_models/product_details_response.dart';
import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:bring_me_bd/app/data/repository/product_repository_impl.dart';
import 'package:bring_me_bd/app/domain/repossitory/product_repository.dart';
import 'package:bring_me_bd/app/modules/home/controllers/cart_controller.dart';
import 'package:bring_me_bd/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  Product productModel = Get.arguments;
  Rx<ProductDetailsResponse?> response = Rx(null);
  Rx<ProductListResponse?> relatedProducts = Rx(null);

  PageController pageController = PageController();
  ProductRepository productRepository = Get.find<ProductRepositoryImpl>();

  Rx<Map<num, num>> selectedOptions = Rx({});

  bool get isInWishList =>
      Get.find<HomeController>().isInWishList(productModel.id);

  @override
  void onInit() async {
    super.onInit();
    response.value = await productRepository.getProductDetails(productModel.id);

    /*relatedProducts.value =
        await productRepository.getRelatedProductsBySku(productModel.sku);*/
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void addToWishList() {
    Get.find<HomeController>().addToWishList(productModel);
  }

  void addToCart() {
    if (response.value?.data?.type != "configurable") {
      Get.find<CartController>().addItemToCart(productModel);
    } else {
      if (selectedOptions.value.length !=
          response.value?.data?.superAttributes?.length) {
        Get.snackbar('Error',
            'Please  select ${response.value?.data?.superAttributes?.map((a) => a.name).join(", ")}');
      } else {
        ProductDetails selectedProduct = getVariants().first;
        Get.find<CartController>().addItemConfigurableToCart(
          productModel,
          selectedProduct.id!,
          selectedOptions.value,
        );
      }
    }
  }

  List<ProductDetails> getVariants() {
    if (selectedOptions.value.isEmpty) return [];
    List<ProductDetails> vari = response.value?.data?.variants ?? [];
    if (selectedOptions.value.isNotEmpty) {
      var supperAttributes = response.value!.data!.superAttributes!;
      for (int i = 0; i < supperAttributes.length; i++) {
        vari = getVariantByAttribute(vari, supperAttributes[i], i);
      }
    }
    return vari;
  }

  List<ProductDetails> getVariantByAttribute(
    List<ProductDetails> variants,
    SuperAttributes attribute,
    int attrIndex,
  ) {
    return variants.where((variant) {
      List<String> attributes =
          variant.sku?.split("variant-").last.split("-").toList() ?? [];
      if (selectedOptions.value[attribute.id] == null) {
        return true;
      }
      return attributes[attrIndex] ==
          selectedOptions.value[attribute.id].toString();
    }).toList();
  }

  selectOption(num num, num num2) {
    selectedOptions.update((val) {
      val ??= {};
      val[num] = num2;
      selectedOptions.value = val;
    });
  }
}
