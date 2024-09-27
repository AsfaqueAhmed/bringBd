import 'package:get/get.dart';

import '../controllers/cart_item_list_controller.dart';

class CartItemListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartItemListController>(
      () => CartItemListController(),
    );
  }
}
