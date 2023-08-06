import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/injection.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/presentation/current_weather/current_weather_store.dart';
import 'package:weather/services/location_service.dart';
import 'package:weather/services/weather_service_api.dart';
import 'package:weather/services/weather_service_api_impl.dart';

import 'current_weather_store_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<WeatherServiceApi>(),
  MockSpec<LocationService>(),
  MockSpec<Dio>(),
  MockSpec<Position>()
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late CurrentWeatherStore store;

  late MockPosition mockPosition;
  late WeatherModel weatherModel;
  late MockLocationService mockLocationService;
  late MockWeatherServiceApi mockWeatherServiceApi;

  final file = File('test/fixtures/onecall.json');
  final json = file.readAsStringSync();

  setUp(() {
    getIt.allowReassignment = true;

    mockPosition = MockPosition();
    weatherModel = WeatherModel.fromJson(jsonDecode(json));
    mockLocationService = MockLocationService();
    mockWeatherServiceApi = MockWeatherServiceApi();

    getIt.registerSingleton<IWeatherServiceApi>(mockWeatherServiceApi);
    getIt.registerSingleton<LocationService>(mockLocationService);

    when(mockPosition.latitude).thenReturn(10);
    when(mockPosition.longitude).thenReturn(10);

    when(mockLocationService.servicePositionStream)
        .thenAnswer((_) => Stream.value(mockPosition));

    when(mockWeatherServiceApi.fetchWeatherByLocation(any, any))
        .thenAnswer((_) async => weatherModel);

    store = CurrentWeatherStore(
      getIt<IWeatherServiceApi>(),
      getIt<LocationService>(),
    );
  });

  // create group test
  group('Current Weather Store', () {
    test('listenLocation() gets the current weather', () async {
      store.listenLocation();
      await Future.delayed(const Duration(seconds: 1));

      expect(store.maxTemp, '0°C');
      expect(store.minTemp, '0°C');
    });

    test('listenLocation() fetches and updates weather data', () async {
      when(mockLocationService.servicePositionStream)
          .thenAnswer((_) => Stream.value(mockPosition));

      store.listenLocation();
      await Future.delayed(const Duration(
          milliseconds:
              100)); // Add a slight delay to let the async operations complete.

      expect(store.maxTemp, '0°C');
    });

    test('minTemp is 0°C when minimum temperature is not available', () async {
      when(mockLocationService.servicePositionStream)
          .thenAnswer((_) => Stream.value(mockPosition));

      store.listenLocation();
      await Future.delayed(const Duration(
          milliseconds:
              100)); // Add a slight delay to let the async operations complete.

      expect(store.minTemp, '0°C');
    });
  });
}
