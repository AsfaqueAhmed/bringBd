import 'package:bring_me_bd/app/core/controllers/auth_controller.dart';
import 'package:bring_me_bd/app/core/controllers/customer_controller.dart';
import 'package:bring_me_bd/app/core/networking/dio_client.dart';
import 'package:bring_me_bd/app/data/repository/cart_repository_impl.dart';
import 'package:bring_me_bd/app/data/repository/category_repository_impl.dart';
import 'package:bring_me_bd/app/data/repository/common_repository_impl.dart';
import 'package:bring_me_bd/app/data/repository/customer_repository_impl.dart';
import 'package:bring_me_bd/app/data/repository/product_repository_impl.dart';
import 'package:bring_me_bd/app/data/services/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.lazyPut<Dio>(() {
      return DioClient.createDio();
    }, fenix: true);
    Get.lazyPut<CustomerRepositoryImpl>(
        () => CustomerRepositoryImpl(Get.find<Dio>()),
        fenix: true);
    Get.lazyPut<CartRepositoryImpl>(() => CartRepositoryImpl(Get.find<Dio>()),
        fenix: true);
    Get.lazyPut<CustomerController>(() => CustomerController(), fenix: true);
    Get.lazyPut<ProductRepositoryImpl>(() => ProductRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<CommonRepositoryImpl>(() => CommonRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<CategoryRepositoryImpl>(
        () => CategoryRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<StorageService>(() => StorageService(), fenix: true);
  }
}
