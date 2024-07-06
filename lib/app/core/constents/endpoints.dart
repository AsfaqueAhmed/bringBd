import 'package:bring_me_bd/env.dart';

abstract class ApiEndPoints {
  static final String customerLogin =
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/v1/customer/login?accept_token=true";

  static final String customerRegister =
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/v1/customer/register";

  static final String featuredProducts =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products?featured=1&sort=asc&limit=10";

  static final String newProducts =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products?new=1&sort=asc&limit=10";

  static final String products =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products?sort=asc&limit=100";

  static final String sliders =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/v1/sliders?sort=id";

  static final String categories =
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/categories?sort=asc&limit=100&parent_id=1";

  static String productsDetails(id) =>
      "${EnvConfig.getVariable(EnvVariable.authUrl)}/v1/products/$id";

  static String relatedProducts(id) =>
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products/$id/related";

  static String productsById(num? id) =>
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/products?sort=asc&limit=100&category_id=$id";

  static String checkNumberStatus(String number) =>
      "${EnvConfig.getVariable(EnvVariable.baseUrl)}/customer/user-check?phone=8801981995317";
}
