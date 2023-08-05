import 'package:dio/dio.dart';

import 'dio_config.dart';

class DioClient {
  final DioConfig dioConfig;
  final Dio _dio;

  DioClient({required this.dioConfig})
      : _dio = Dio()
          ..options.baseUrl = dioConfig.baseUrl
          ..options.connectTimeout =
              Duration(milliseconds: dioConfig.connectionTimeout)
          ..options.receiveTimeout =
              Duration(milliseconds: dioConfig.receiveTimeout);

  Dio get dio => _dio;

  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    return _dio..interceptors.addAll(interceptors);
  }
}
