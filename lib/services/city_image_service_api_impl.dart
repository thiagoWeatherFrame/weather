import 'dart:math';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/data/interceptors/city_image_api_dio_interceptor.dart';
import 'package:weather/services/city_image_service_api.dart';

import '../constants/strings.dart';

const String kCityImageByQuery = '/search';
const String kDefaultImageUrl =
    'https://www.otempo.com.br/image/contentid/policy:1.2792073:1672869765/belohorizonte-jpeg.jpeg?f=3x2&w=1224';

@Injectable(as: ICityImageServiceApi)
class CityImageServiceApi extends ICityImageServiceApi {
  Dio get dio => Dio(BaseOptions(baseUrl: Strings.imageBaseUrl))
    ..interceptors.add(CityImageApiRequestInterceptor());

  CityImageServiceApi();

  @override
  Future<String> fetchImageUrlByQuery(String query) async {
    final response =
        await dio.get(kCityImageByQuery, queryParameters: {'query': query});
    if (response.statusCode == 200) {
      try {
        return _getImageUrl(response);
      } catch (e) {
        throw Exception('Falha ao obter imagem da cidade');
      }
    } else {
      return kDefaultImageUrl;
    }
  }

  String _getImageUrl(Response response) {
    try {
      return response.data['photos'][randomInt]['src']['medium'];
    } catch (e) {
      return kDefaultImageUrl;
    }
  }

  int get randomInt => Random().nextInt(kImagePageValue - 1);
}
