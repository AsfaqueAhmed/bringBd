import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:bring_me_bd/app/data/dto_models/cart_details_response.dart';
import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:bring_me_bd/app/data/repository/cart_repository_impl.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  Rx<CartDetailsResponse?> cartDetails = Rx(null);

  @override
  onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1000), () => loadCartDetails());
  }

  loadCartDetails() {
    try {
      Get.find<CartRepositoryImpl>().getCartDetails().then((v) {
        cartDetails.value = v;
      });
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
    }
  }

  addItemToCart(Product productModel) async {
    try {
      var v =
          await Get.find<CartRepositoryImpl>().addToCart(productModel.id, 1);
      cartDetails.value = v;

      Get.showSnackbar(const GetSnackBar(
        title: "Cart updated",
        message: "Product added to cart.",
        duration: Duration(seconds: 2),
      ));
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: e.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  decreaseQuantity(CartItem item) async {
    try {
      var v;
      if ((item.quantity ?? 0) > 1) {
        v = await Get.find<CartRepositoryImpl>()
            .updateCart(item.id, item.quantity! - 1);
      } else {
        v = await Get.find<CartRepositoryImpl>().removeFromCart(item.id);
      }

      cartDetails.value = v;
      Get.showSnackbar(const GetSnackBar(
        title: "Cart updated",
        message: "Product quantity updated.",
        duration: Duration(seconds: 2),
      ));
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: e.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  increaseQuantity(CartItem item) async {
    try {
      var v = await Get.find<CartRepositoryImpl>()
          .updateCart(item.id, item.quantity! + 1);

      cartDetails.value = v;

      Get.showSnackbar(const GetSnackBar(
        title: "Cart updated",
        message: "Product quantity updated.",
        duration: Duration(seconds: 2),
      ));
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: e.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  void addItemConfigurableToCart(Product productModel, num configurableId,
      Map<num, num> selectedOptions) async {
    try {
      var v = await Get.find<CartRepositoryImpl>().addToCart(
        productModel.id,
        1,
        configurableId,
        selectedOptions,
      );
      cartDetails.value = v;

      Get.showSnackbar(const GetSnackBar(
        title: "Cart updated",
        message: "Product added to cart.",
        duration: Duration(seconds: 2),
      ));
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: e.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }
}
