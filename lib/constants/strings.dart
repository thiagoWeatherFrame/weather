class Strings {
  Strings._();

  //General
  static const String appName = "Weather";
  static const String homeTitle = 'Previsão tempo para hoje';
  static const String noWeatherDataExceptionMessage =
      'Não foi possível obter os dados do tempo. Por favor, tente novamente mais tarde.';
  static const String invalidWeatherDataExceptionMessage = 'Dados inválidos:';
  static const String apiExceptionMessage = 'Nenhum dado recebido da API.';

  static const String weatherApiKey = '7044d589f7d6abe1af865e39cb256220';
  static const String weatherBaseUrl =
      'https://api.openweathermap.org/data/2.5';
  static const String weatherIconBaseUrl = 'https://openweathermap.org/img/wn/';

  static const String imageApiKey =
      'Ex6HtAjDfMn5ElcowHB9f8TUEWTzdK5qzsFXcHFqC08g1bTkTxCeU3TE';
  static const String imageBaseUrl = 'https://api.pexels.com/v1/';

  static const String queryMetric = 'metric';
  static const String queryLanguage = 'pt_br';
}
