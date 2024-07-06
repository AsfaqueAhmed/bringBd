import 'package:bring_me_bd/app/core/widgets/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.categoryModel.name!),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.products.value == null
            ? const Center(
                child: CupertinoActivityIndicator(),
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
                  var product = controller.products.value!.data![index];
                  return ProductTile(product: product);
                },
                itemCount: controller.products.value!.data!.length,
              ),
      ),
    );
  }
}
