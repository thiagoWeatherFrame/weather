import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/constants/strings.dart';
import 'package:weather/exception/weather_api_exceptions.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/services/weather_service_api.dart';
import 'package:weather/services/weather_service_api_impl.dart';
import 'weather_api_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late MockDio mockDio;
  late IWeatherServiceApi weatherApi;

  final file = File('test/fixtures/onecall.json');
  final json = file.readAsStringSync();

  final fileInvalidData = File('test/fixtures/onecall_invalid.json');
  final jsonInvalidData = fileInvalidData.readAsStringSync();
  final getIt = GetIt.instance;

  setUp(() async {
    getIt.allowReassignment = true;

    mockDio = MockDio();
    weatherApi = WeatherServiceApi(mockDio);
    mockDio.options = BaseOptions(
        baseUrl: Strings.weatherBaseUrl,
        queryParameters: {'appid': Strings.weatherApiKey});
    getIt.registerFactory(() => mockDio);
  });

  group('WeatherApi', () {
    test('Should fetchCurrentWeatherByLocation', () async {
      when(mockDio.get(
        kCurrentWeatherByLocation,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => Response(
          data: jsonDecode(json) as Map<String, dynamic>,
          statusCode: 200,
          requestOptions: RequestOptions(path: kCurrentWeatherByLocation)));

      expect(
        await weatherApi.fetchWeatherByLocation(10, 10),
        isA<WeatherModel>(),
      );
    });

    test('Should return failure on 401', () async {
      when(mockDio.get(
        kCurrentWeatherByLocation,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: kCurrentWeatherByLocation)));
      expect(() async => await weatherApi.fetchWeatherByLocation(10, 10),
          throwsA(isA<UnauthorizedWeatherApiDataException>()));
    });

    test('Should return failure on invalid json', () async {
      when(mockDio.get(
        kCurrentWeatherByLocation,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => Response(
          data: jsonDecode(jsonInvalidData) as Map<String, dynamic>,
          statusCode: 200,
          requestOptions: RequestOptions(path: kCurrentWeatherByLocation)));
      expect(() async => await weatherApi.fetchWeatherByLocation(10, 10),
          throwsA(isA<WeatherApiDataException>()));
    });
  });
}
