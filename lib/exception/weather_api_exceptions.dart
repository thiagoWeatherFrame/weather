class WeatherApiDataException implements Exception {
  String message;

  WeatherApiDataException(this.message);
}

class UnauthorizedWeatherApiDataException implements Exception {
  String message;

  UnauthorizedWeatherApiDataException(this.message);
}
