import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/constants/strings.dart';
import 'package:weather/data/interceptors/weather_api_dio_interceptor.dart';

@module
abstract class RegisterDataModule {
  @Named("BaseUrl")
  String get baseUrl => Strings.weatherBaseUrl;

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) {
    return Dio(BaseOptions(baseUrl: url))
      ..interceptors.add(WeatherApiRequestInterceptor());
  }
}
