import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:bring_me_bd/app/data/dto_models/category_list_response.dart';
import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:bring_me_bd/app/data/dto_models/slider_list_response.dart';
import 'package:bring_me_bd/app/data/repository/category_repository_impl.dart';
import 'package:bring_me_bd/app/data/repository/common_repository_impl.dart';
import 'package:bring_me_bd/app/data/repository/product_repository_impl.dart';
import 'package:bring_me_bd/app/data/services/storage_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<ProductListResponse?> newArrival = Rx(null);
  Rx<ProductListResponse?> products = Rx(null);
  Rx<ProductListResponse?> featured = Rx(null);
  Rx<SliderListResponse?> sliders = Rx(null);

  Rx<List<Product>> myWishList = Rx([]);

  RxBool loading = true.obs;

  ProductRepositoryImpl productRepositoryImpl =
      Get.find<ProductRepositoryImpl>();
  StorageService storageService = Get.find<StorageService>();

  CommonRepositoryImpl commonRepositoryImpl = Get.find<CommonRepositoryImpl>();

  RxInt currentTab = 2.obs;

  Rx<CategoryListResponse?> categories = Rx(null);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future loadData() async {
    loading.value = true;
    _loadSliders();
    _loadFeatured();
    _loadNew();
    _loadProducts();
    _loadCategories();
    _loadWishList();
    loading.value = false;
  }

  void _loadSliders() async {
    try {
      sliders.value = await commonRepositoryImpl.getSliders();
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
    }
  }

  void _loadFeatured() async {
    try {
      featured.value = await productRepositoryImpl.getFeaturedProducts();
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
    }
  }

  void _loadNew() async {
    try {
      newArrival.value = await productRepositoryImpl.getNewProducts();
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
    }
  }

  void _loadProducts() async {
    try {
      products.value = await productRepositoryImpl.getProducts();
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
    }
  }

  void _loadCategories() async {
    try {
      categories.value =
          await Get.find<CategoryRepositoryImpl>().getAllCategories();
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
    }
  }

  void _loadWishList() {
    myWishList.value = storageService.getWishList();
  }

  void addToWishList(Product product) {
    myWishList.value = storageService.addToWishList(product);
  }

  isInWishList(num? id) {
    return myWishList.value.any((p) => p.id == id);
  }

  void removeFromWishList(num? id) {
    myWishList.value = storageService.removeFromWishList(id);
  }
}
