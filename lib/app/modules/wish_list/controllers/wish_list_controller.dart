import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:bring_me_bd/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  Rx<List<Product>> wishList = Get.find<HomeController>().myWishList;

  remove(num? id) {
    Get.find<HomeController>().removeFromWishList(id);
  }
}
