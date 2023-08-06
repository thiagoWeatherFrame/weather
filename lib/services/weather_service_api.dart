import '../model/weather_model.dart';

abstract class IWeatherServiceApi {
  Future<WeatherModel> fetchWeatherByLocation(double lat, double lon);
}
