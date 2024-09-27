import 'package:bring_me_bd/app/data/dto_models/cart_details_response.dart';

abstract class CartRepository {
  Future<CartDetailsResponse?> addToCart(dynamic itemId, dynamic quantity,
      [num selectedVariantId, Map<num, num> options]);

  Future<CartDetailsResponse> getCartDetails();
}
