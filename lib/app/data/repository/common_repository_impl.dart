import 'package:bring_me_bd/app/core/constents/endpoints.dart';
import 'package:bring_me_bd/app/data/dto_models/slider_list_response.dart';
import 'package:bring_me_bd/app/domain/repossitory/common_repository.dart';
import 'package:dio/dio.dart';

class CommonRepositoryImpl extends CommonRepository {
  final Dio _dio;

  CommonRepositoryImpl(this._dio);

  @override
  Future<SliderListResponse> getSliders() async {
    final response = await _dio.get(
      ApiEndPoints.sliders,
    );

    return SliderListResponse.fromJson(response.data);
  }

  
}
