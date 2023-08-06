import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather/exception/weather_model_exceptions.dart';
import 'package:weather/model/weather_model.dart';

void main() {
  late File file;
  late String json;
  late Map<String, dynamic> jsonMap;

  late File fileInvalidData;
  late String jsonInvalidData;
  late Map<String, dynamic> jsonMapInvalidData;

  setUp(() {
    file = File('test/fixtures/onecall.json');
    json = file.readAsStringSync();
    jsonMap = jsonDecode(json) as Map<String, dynamic>;

    fileInvalidData = File('test/fixtures/onecall_invalid.json');
    jsonInvalidData = fileInvalidData.readAsStringSync();
    jsonMapInvalidData = jsonDecode(jsonInvalidData) as Map<String, dynamic>;
  });

  group('Weather', () {
    test('Should convert from valid json', () {
      final weather = WeatherModel.fromJson(jsonMap);
      expect(weather, isA<WeatherModel>());
    });
    test('Should fail with invalid json', () {
      expect(
        () => WeatherModel.fromJson(jsonMapInvalidData),
        throwsA(
          predicate(
            (e) =>
                e is InvalidWeatherDataException &&
                e.message.contains(
                  'is not a subtype of type',
                ) &&
                e.stackTrace != null,
          ),
        ),
      );
    });
    test('Should fail with empty json', () {
      expect(() => WeatherModel.fromJson({}),
          throwsA(isA<NoWeatherDataException>()));
    });
  });
}
