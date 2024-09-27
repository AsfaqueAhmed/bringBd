import 'package:bring_me_bd/app/modules/cart/cart_item_list/widgets/cart_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_item_list_controller.dart';

class CartItemListView extends GetView<CartItemListController> {
  const CartItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          itemBuilder: (_, index) {
            return CartItemTile(item: controller.items[index]);
          },
          itemCount: controller.items.length,
        );
      }),
    );
  }
}
