import 'package:bring_me_bd/app/data/dto_models/cart_details_response.dart';
import 'package:bring_me_bd/app/modules/home/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartItemListController extends GetxController {
  CartController cartController = Get.find<CartController>();

  List<CartItem> get items =>
      cartController.cartDetails.value?.details?.items ?? [];

  @override
  void onInit() {
    cartController.loadCartDetails();
    super.onInit();
  }
}
