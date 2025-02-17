import 'package:bring_me_bd/app/core/constents/images.dart';
import 'package:bring_me_bd/app/core/widgets/product_tile.dart';
import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:bring_me_bd/app/modules/cart/cart_item_list/widgets/cart_action_button.dart';
import 'package:bring_me_bd/app/modules/home/views/widgets/cattegory_drawers.dart';
import 'package:bring_me_bd/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppImages.logo,height: 48,width: 48,),
            const Text('bringme.bd'),
          ],
        ),
        actions: [
          CartIndicator(),
          const SizedBox(width: 4),
        ],
      ),
      body: Obx(
        () => controller.loading.value ? _buildLoading() : _buildProductList(),
      ),
      drawer: Obx(() => CategoryDrawer(
            categories: controller.categories.value?.data ?? [],
          )),
    );
  }

  Widget _buildLoading() {
    return ListView(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 200,
              color: Colors.white,
            ),
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(12),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 16.0,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 16.0,
                        width: 120.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Widget to build actual product list
  Widget _buildProductList() {
    return RefreshIndicator(
      onRefresh: controller.loadData,
      child: ListView(
        children: [
          Obx(
            () {
              var sliders = controller.sliders.value?.sliders;
              return SizedBox(
                height: 200, // Height of the carousel slider
                child: CarouselSlider.builder(
                  itemCount: sliders?.length ?? 0,
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: sliders?[index].imageUrl ?? "",
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          placeholder: (_, __) => Image.asset(
                            AppImages.banner,
                            fit: BoxFit.cover,
                          ),
                          errorWidget: (_, __, ___) => Image.asset(
                            AppImages.banner,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );

                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          AppImages.banner,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          Obx(() => _gridItem(
              controller.newArrival.value?.data ?? [], "New Arrival")),
          Obx(() =>
              _gridItem(controller.featured.value?.data ?? [], "Featured")),
          Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "Products",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 8),

                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            childAspectRatio: 0.85),
                    itemBuilder: (_, index) {
                      var product = controller.products.value!.data![index];
                      return ProductTile(product: product);
                    },
                    itemCount: controller.products.value?.data?.length ?? 0,
                  )
                  // ...controller.products.value!.data!.map((product) {
                  //   return _featuredOrNewArrival(product);
                  // }),
                ],
              )),
        ],
      ),
    );
  }

  Widget _gridItem(List<Product> products, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 4),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          //color: Colors.yellow,
          height: 241,
          child: ListView.builder(
            padding: const EdgeInsets.all(6),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var product = products[index];
              return ProductTile(product: product);
            },
            itemCount: products.length,
          ),
        )
      ],
    );
  }
}
