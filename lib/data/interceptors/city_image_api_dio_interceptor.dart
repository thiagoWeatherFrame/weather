import 'package:dio/dio.dart';
import 'package:weather/constants/strings.dart';

const _kOrientationKey = 'orientation';
const _kSizeKey = 'size';
const _kLanguageQueryKey = 'locale';
const _kPerPageKey = 'per_page';
const kImagePageValue = 5;

class CityImageApiRequestInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters
      ..putIfAbsent(_kOrientationKey, () => 'landscape')
      ..putIfAbsent(_kSizeKey, () => 'small')
      ..putIfAbsent(_kPerPageKey, () => kImagePageValue)
      ..putIfAbsent(_kLanguageQueryKey, () => '_kLanguageQueryKey');
    options.headers.putIfAbsent('Authorization', () => Strings.imageApiKey);

    super.onRequest(options, handler);
  }
}
