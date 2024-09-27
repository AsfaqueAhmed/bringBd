import 'package:bring_me_bd/env.dart';

abstract class ApiEndPoints {
  static final String customerLogin =
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/customer/login?accept_token=true";

  static final String customerRegister =
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/customer/register";

  static final String otpCheck =
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/customer/otp-check";

  static final String featuredProducts =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products?featured=1&sort=asc&limit=10";

  static final String newProducts =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products?new=1&sort=asc&limit=10";

  static final String products =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products?sort=asc&limit=100";

  static final String sliders =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/sliders?sort=id";

  static final String categories =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/categories";

  static String productsDetails(id) =>
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/products/$id";

  static String relatedProducts(id) =>
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products/$id/related";

  static String relatedProductsBySku(sku) =>
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products?sku=$sku";

  static String productsById(num? id) =>
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products?sort=asc&limit=100&category_id=$id";

  static String checkNumberStatus(String number) =>
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/customer/user-check?phone=$number";

  static final String phoneCustomerRegister =
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/customer/register";

  static String cartDetails =
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/checkout/cart?token=true";

  static String cartUpdate =
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/checkout/cart/update?token=true";

  static String removeCartItem(dynamic id) =>
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/checkout/cart/remove-item/$id?token=true";

  static String addCart(dynamic id) =>
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/checkout/cart/add/$id?token=true";
}
