import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/services/weather_service_api.dart';

import '../exception/weather_api_exceptions.dart';
import '../model/weather_model.dart';

const String kCurrentWeatherByLocation = '/weather';

@Injectable(as: IWeatherServiceApi)
class WeatherServiceApi extends IWeatherServiceApi {
  final Dio dio;

  WeatherServiceApi(this.dio);

  @override
  Future<WeatherModel> fetchWeatherByLocation(double lat, double lon) async {
    final result = await dio.get(kCurrentWeatherByLocation,
        queryParameters: {'lat': lat, 'lon': lon});
    if (result.statusCode != 200) {
      throw UnauthorizedWeatherApiDataException(
          'Verifique a chave de api informada.');
    }
    try {
      return WeatherModel.fromJson(result.data as Map<String, dynamic>);
    } catch (e) {
      throw WeatherApiDataException('Falha ao obter dados do clima');
    }
  }
}
