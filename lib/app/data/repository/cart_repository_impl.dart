import 'package:bring_me_bd/app/core/constents/endpoints.dart';
import 'package:bring_me_bd/app/data/dto_models/cart_details_response.dart';
import 'package:bring_me_bd/app/domain/repossitory/cart_repository.dart';
import 'package:dio/dio.dart';

class CartRepositoryImpl extends CartRepository {
  final Dio _dio;

  CartRepositoryImpl(this._dio);

  @override
  Future<CartDetailsResponse?> addToCart(itemId, quantity,
      [num? selectedVariantId, Map<num, num>? options]) async {
    final response = await _dio.post(ApiEndPoints.addCart(itemId), data: {
      "product_id": itemId,
      "quantity": quantity,
      if (selectedVariantId != null)
        "selected_configurable_option": selectedVariantId,
      if (options != null)
        "super_attribute": options.map((k, v) => MapEntry(k.toString(), v))
    });

    var r = CartDetailsResponse.fromJson(response.data);
    if (r.details != null) {
      return r;
    }
    throw (response.data['error']?['message'] ?? "Cart upload failed");
  }

  @override
  Future<CartDetailsResponse> getCartDetails() async {
    final response = await _dio.get(
      ApiEndPoints.cartDetails,
    );

    return CartDetailsResponse.fromJson(response.data);
  }

  Future<CartDetailsResponse> updateCart(int? id, int i) async {
    final response = await _dio.put(ApiEndPoints.cartUpdate, data: {
      "qty": {"$id": "$i"}
    });

    return  CartDetailsResponse.fromJson(response.data);
  }

  Future<CartDetailsResponse> removeFromCart(int? id) async {
    final response = await _dio.get(ApiEndPoints.removeCartItem(id),);

    return  CartDetailsResponse.fromJson(response.data);
  }
}
