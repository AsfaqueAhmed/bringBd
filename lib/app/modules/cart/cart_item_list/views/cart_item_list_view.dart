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
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemBuilder: (_, index) {
                  return CartItemTile(item: controller.items[index]);
                },
                itemCount: controller.items.length,
              );
            }),
          ),

          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                ),
              ],
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: controller.toCheckOut,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
