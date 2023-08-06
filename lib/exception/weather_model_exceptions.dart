class NoWeatherDataException implements Exception {
  final String message;

  NoWeatherDataException(this.message);
}

class InvalidWeatherDataException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  InvalidWeatherDataException(this.message, Object e, this.stackTrace);
}
