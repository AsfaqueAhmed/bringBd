import 'package:bring_me_bd/app/data/dto_models/slider_list_response.dart';

abstract class CommonRepository {
  Future<SliderListResponse> getSliders();
}
