import 'package:get/get.dart';

import '../modules/auth_email//login/bindings/login_binding.dart';
import '../modules/auth_email//login/views/login_view.dart';
import '../modules/auth_email//sign_up/bindings/sign_up_binding.dart';
import '../modules/auth_email//sign_up/views/sign_up_view.dart';
import '../modules/auth_phone/phone_login/bindings/phone_login_binding.dart';
import '../modules/auth_phone/phone_login/views/phone_login_view.dart';
import '../modules/auth_phone/phone_register/bindings/phone_register_binding.dart';
import '../modules/auth_phone/phone_register/views/phone_register_view.dart';
import '../modules/auth_phone/register_otp_verify/bindings/register_otp_verify_binding.dart';
import '../modules/auth_phone/register_otp_verify/views/register_otp_verify_view.dart';
import '../modules/cart/cart_item_list/bindings/cart_item_list_binding.dart';
import '../modules/cart/cart_item_list/views/cart_item_list_view.dart';
import '../modules/check_out/bindings/check_out_binding.dart';
import '../modules/check_out/views/check_out_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/product_list/bindings/product_list_binding.dart';
import '../modules/product_list/views/product_list_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/wish_list/bindings/wish_list_binding.dart';
import '../modules/wish_list/views/wish_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: _Paths.WISH_LIST,
      page: () => const WishListView(),
      binding: WishListBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_LOGIN,
      page: () => const PhoneLoginView(),
      binding: PhoneLoginBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_REGISTER,
      page: () => const PhoneRegisterView(),
      binding: PhoneRegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_OTP_VERIFY,
      page: () => const RegisterOtpVerifyView(),
      binding: RegisterOtpVerifyBinding(),
    ),
    GetPage(
      name: _Paths.CART_ITEM_LIST,
      page: () => const CartItemListView(),
      binding: CartItemListBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_OUT,
      page: () => const CheckOutView(),
      binding: CheckOutBinding(),
    ),
  ];
}
