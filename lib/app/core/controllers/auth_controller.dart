import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final Rx<String?> _token = Rx(null);

  Future<String?> token() async {
    _token.value ??= GetStorage().read("token");
    return _token.value;
  }

  void setToken(String newToken) {
    _token.value = newToken;
  }
}
