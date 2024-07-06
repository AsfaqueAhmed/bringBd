import 'dart:convert';
import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  GetStorage getStorage = GetStorage();

  List<Product> getWishList() {
    String? wishListJson = getStorage.read("wish_list");
    return jsonDecode(wishListJson ?? '[]').map((wli) {
      return Product.fromJson(wli);
    }).toList().cast<Product>();
  }

  List<Product> addToWishList(Product item) {
    List<Product> wishList = getWishList();
    wishList.add(item);
    var itemListJson = jsonEncode(wishList.map((e) => e.toJson()).toList());
    getStorage.write("wish_list", itemListJson);
    return wishList;
  }

  List<Product> removeFromWishList(num? id) {
    List<Product> wishList = getWishList();
    wishList.removeWhere((p)=>p.id==id);
    var itemListJson = jsonEncode(wishList.map((e) => e.toJson()).toList());
    getStorage.write("wish_list", itemListJson);
    return wishList;
  }
}
