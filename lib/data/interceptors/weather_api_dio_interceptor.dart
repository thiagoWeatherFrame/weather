import 'package:dio/dio.dart';
import 'package:weather/constants/strings.dart';

const _kApiIdKey = 'appid';
const _kUnitQueryKey = 'units';
const _kLanguageQueryKey = 'lang';

class WeatherApiRequestInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters
      ..putIfAbsent(_kApiIdKey, () => Strings.weatherApiKey)
      ..putIfAbsent(_kUnitQueryKey, () => Strings.queryMetric)
      ..putIfAbsent(_kLanguageQueryKey, () => Strings.queryLanguage);

    super.onRequest(options, handler);
  }
}
