import 'package:bring_me_bd/app/data/model/category_model.dart';
import 'package:bring_me_bd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDrawer extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryDrawer({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 60),
        children: categories.map((category) {
          return ListTile(
            onTap: () {
              Get.back();
              Get.toNamed(Routes.PRODUCT_LIST, arguments: category);
            },
            title: Text(category.name!),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        }).toList(),
      ),
    );
  }
}
