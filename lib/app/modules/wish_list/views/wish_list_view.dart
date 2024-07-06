import 'package:bring_me_bd/app/core/widgets/empty.dart';
import 'package:bring_me_bd/app/core/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/wish_list_controller.dart';

class WishListView extends GetView<WishListController> {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.wishList.value.isEmpty
            ? const Center(
                child: Empty(),
              )
            : GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 0.85),
                itemBuilder: (_, index) {
                  var product = controller.wishList.value[index];
                  return Stack(
                    children: [
                      SizedBox(width:double.infinity,child: ProductTile(product: product)),
                       Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: ()=>controller.remove(product.id),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: controller.wishList.value.length,
              ),
      ),
    );
  }
}
