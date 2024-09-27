import 'package:bring_me_bd/app/core/widgets/product_tile.dart';
import 'package:bring_me_bd/app/data/dto_models/product_details_response.dart';
import 'package:bring_me_bd/app/modules/cart/cart_item_list/widgets/cart_action_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  final _tag = Get.arguments.id.toString();

  @override
  String? get tag => _tag;

  ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        actions: [
          CartIndicator(),
        ],
      ),
      body: Obx(
        () {
          if (controller.response.value == null) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          var productDetails = controller.response.value!.data!;

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _slider(),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Text(
                            productDetails.formattedPrice ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 40,
                            child: IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: IconButton(
                              icon: Obx(() {
                                var isInWishList = controller.isInWishList;
                                return Icon(
                                  !isInWishList
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  color: isInWishList ? Colors.red : null,
                                );
                              }),
                              onPressed: controller.addToWishList,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        productDetails.name ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          RatingBar(productDetails.reviews?.averageRating
                              ?.toDouble()),
                          const SizedBox(width: 2),
                          Text(
                            "(${productDetails.reviews?.totalRating?.toString()} reviews)",
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (controller.response.value?.data?.variants?.isNotEmpty ==
                        true)
                      _varients(),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: ExpandableText(
                        productDetails.description ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                        expandText: 'See More',
                        maxLines: 10,
                        collapseText: "See Less",
                        collapseOnTextTap: true,
                        linkColor: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Obx(
                      () => controller.relatedProducts.value == null ||
                              controller.relatedProducts.value?.data
                                      ?.isNotEmpty !=
                                  true
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 12, top: 4),
                                  child: Text(
                                    "Related products",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
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
                                      var product = controller
                                          .relatedProducts.value!.data![index];
                                      return ProductTile(product: product);
                                    },
                                    itemCount: controller
                                        .relatedProducts.value!.data!.length,
                                  ),
                                )
                              ],
                            ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
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
                        onTap: controller.addToCart,
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
                    /*const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox _slider() {
    var images = [...controller.response.value!.data!.images!];
    var availAbleVariants = controller.getVariants();
    for (var a in availAbleVariants) {
      images.insertAll(0, a.images ?? []);
    }
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: images.length,
            itemBuilder: (_, index) {
              return CachedNetworkImage(
                imageUrl: images[index].mediumImageUrl!,
                fit: BoxFit.contain,
                placeholder: (_, __) => _imagePlaceHolder(),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: AnimatedBuilder(
                animation: controller.pageController,
                builder: (BuildContext context, Widget? child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Text(
                      "${(controller.pageController.page?.toInt() ?? 0) + 1}/${images.length}",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _imagePlaceHolder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Center(
            child: Text(
              'Loading...',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _varients() {
    List<ProductDetails> variants =
        controller.response.value?.data?.variants ?? [];
    return Column(
      children: List.generate(
          controller.response.value?.data?.superAttributes?.length ?? 0,
          (index1) {
        var superAttribute =
            controller.response.value?.data?.superAttributes?[index1];
        return Container(
          margin: const EdgeInsets.only(top: 6),
          height: 36,
          child: Row(
            children: [
              const SizedBox(width: 12),
              Text(
                "${superAttribute?.name ?? ""} : ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(superAttribute?.options?.length ?? 0,
                      (index2) {
                    var option = superAttribute?.options?[index2];
                    bool isAvailable = variants.any((variant) {
                      List<String> attributes = variant.sku
                              ?.split("variant-")
                              .last
                              .split("-")
                              .toList() ??
                          [];

                      return attributes[index1] == option?.id?.toString();
                    });

                    if (isAvailable) {
                      var isSelected = option?.id ==
                          controller.selectedOptions.value[superAttribute!.id!];
                      return Center(
                        child: GestureDetector(
                          onTap: () => controller.selectOption(
                            superAttribute.id!,
                            option!.id!,
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: isSelected ? Colors.black : Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              option?.label ?? "",
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double? averageRating;

  const RatingBar(this.averageRating, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Stack(
        children: [
          _bar(5),
          _bar(averageRating, Colors.amber),
        ],
      ),
    );
  }

  _bar(double? averageRating, [Color color = Colors.grey]) {
    return ClipRect(
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: (averageRating ?? 0) / 5,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (_) => Icon(
              Icons.star,
              color: color,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
