// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentWeatherStore on _CurrentWeatherStore, Store {
  Computed<String>? _$cityNameComputed;

  @override
  String get cityName =>
      (_$cityNameComputed ??= Computed<String>(() => super.cityName,
              name: '_CurrentWeatherStore.cityName'))
          .value;
  Computed<String>? _$maxTempComputed;

  @override
  String get maxTemp =>
      (_$maxTempComputed ??= Computed<String>(() => super.maxTemp,
              name: '_CurrentWeatherStore.maxTemp'))
          .value;
  Computed<String>? _$minTempComputed;

  @override
  String get minTemp =>
      (_$minTempComputed ??= Computed<String>(() => super.minTemp,
              name: '_CurrentWeatherStore.minTemp'))
          .value;
  Computed<String>? _$windSpeedComputed;

  @override
  String get windSpeed =>
      (_$windSpeedComputed ??= Computed<String>(() => super.windSpeed,
              name: '_CurrentWeatherStore.windSpeed'))
          .value;
  Computed<String>? _$humidityComputed;

  @override
  String get humidity =>
      (_$humidityComputed ??= Computed<String>(() => super.humidity,
              name: '_CurrentWeatherStore.humidity'))
          .value;

  late final _$_weatherFutureDataAtom =
      Atom(name: '_CurrentWeatherStore._weatherFutureData', context: context);

  @override
  ObservableFuture<WeatherModel> get _weatherFutureData {
    _$_weatherFutureDataAtom.reportRead();
    return super._weatherFutureData;
  }

  @override
  set _weatherFutureData(ObservableFuture<WeatherModel> value) {
    _$_weatherFutureDataAtom.reportWrite(value, super._weatherFutureData, () {
      super._weatherFutureData = value;
    });
  }

  late final _$_currentWeatherAtom =
      Atom(name: '_CurrentWeatherStore._currentWeather', context: context);

  @override
  WeatherModel get _currentWeather {
    _$_currentWeatherAtom.reportRead();
    return super._currentWeather;
  }

  @override
  set _currentWeather(WeatherModel value) {
    _$_currentWeatherAtom.reportWrite(value, super._currentWeather, () {
      super._currentWeather = value;
    });
  }

  late final _$locationStreamAtom =
      Atom(name: '_CurrentWeatherStore.locationStream', context: context);

  @override
  ObservableStream<Position> get locationStream {
    _$locationStreamAtom.reportRead();
    return super.locationStream;
  }

  @override
  set locationStream(ObservableStream<Position> value) {
    _$locationStreamAtom.reportWrite(value, super.locationStream, () {
      super.locationStream = value;
    });
  }

  late final _$_CurrentWeatherStoreActionController =
      ActionController(name: '_CurrentWeatherStore', context: context);

  @override
  void listenLocation() {
    final _$actionInfo = _$_CurrentWeatherStoreActionController.startAction(
        name: '_CurrentWeatherStore.listenLocation');
    try {
      return super.listenLocation();
    } finally {
      _$_CurrentWeatherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locationStream: ${locationStream},
cityName: ${cityName},
maxTemp: ${maxTemp},
minTemp: ${minTemp},
windSpeed: ${windSpeed},
humidity: ${humidity}
    ''';
  }
}
