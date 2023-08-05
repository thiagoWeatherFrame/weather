const _kDefaultReceiveTimeout = 10000;
const _kDefaultConnectionTimeout = 10000;

class DioConfig {
  final String baseUrl;
  final int receiveTimeout;
  final int connectionTimeout;

  DioConfig({
    required this.baseUrl,
    this.receiveTimeout = _kDefaultReceiveTimeout,
    this.connectionTimeout = _kDefaultConnectionTimeout,
  });
}
