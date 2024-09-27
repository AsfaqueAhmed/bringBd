import 'package:bring_me_bd/app/core/constents/colors.dart';
import 'package:bring_me_bd/app/data/dto_models/cart_details_response.dart';
import 'package:bring_me_bd/app/modules/home/controllers/cart_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(left: 12, right: 12),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 0.5),
      )),
      height: 64,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: item.product?.baseImage?.mediumImageUrl ?? "",
            width: 80,
            height: 64,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${num.parse(item.price.toString()).toStringAsFixed(1)} x ${item.quantity} = ${num.parse(item.total.toString()).toStringAsFixed(1)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.primary.withOpacity(0.1)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => Get.find<CartController>()
                                .decreaseQuantity(item),
                            child: Container(
                              color: Colors.transparent,
                              height: 24,
                              width: 24,
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border.symmetric(
                                vertical: BorderSide(width: 0.5),
                              ),
                              color: Colors.white,
                            ),
                            height: 28,
                            width: 36,
                            child: Center(
                              child: Text(
                                item.quantity.toString(),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.find<CartController>()
                                .increaseQuantity(item),
                            child: Container(
                              color: Colors.transparent,
                              height: 24,
                              width: 24,
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
