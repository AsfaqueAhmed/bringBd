import 'package:bring_me_bd/app/core/constents/colors.dart';
import 'package:bring_me_bd/app/modules/home/controllers/cart_controller.dart';
import 'package:bring_me_bd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartIndicator extends GetView<CartController> {
  final RxBool scaleUp = false.obs;
  final RxInt previousCount = 0.obs;

  CartIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.CART_ITEM_LIST),
      child: Obx(
        () {
          var itemCount = 0;
          controller.cartDetails.value?.details?.items?.forEach((e){
            itemCount+=e.quantity??0;
          });
          if (previousCount.value != itemCount) {
            scaleUp.value = true;
            Future.delayed(const Duration(milliseconds: 150), ()=>scaleUp(false));
          }
          previousCount.value = itemCount ?? 0;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,),
                    child: AnimatedScale(
                      scale: scaleUp.value ? 1.5 : 1,
                      duration: const Duration(milliseconds: 100),
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ),
                  Positioned(
                    top: -8,
                    right: -4,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.primary,
                      child: Text(
                        itemCount.toString() ?? "0",
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
