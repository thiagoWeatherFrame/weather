import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/services/weather_service_api.dart';

import '../../model/weather_model.dart';
import '../../services/location_service.dart';

part 'current_weather_store.g.dart';

@injectable
// ignore: library_private_types_in_public_api
class CurrentWeatherStore = _CurrentWeatherStore with _$CurrentWeatherStore;

abstract class _CurrentWeatherStore with Store {
  final IWeatherServiceApi weatherServiceApi;
  final LocationService locationService;

  _CurrentWeatherStore(this.weatherServiceApi, this.locationService);

  @observable
  ObservableFuture<WeatherModel> _weatherFutureData =
      ObservableFuture.value(WeatherModel.empty());

  @observable
  WeatherModel _currentWeather = WeatherModel.empty();

  @observable
  ObservableStream<Position> locationStream = ObservableStream(
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 10,
      ),
    ),
  );

  @computed
  String get cityName => _currentWeather.name ?? 'Belo Horizonte';

  @computed
  String get maxTemp => '${_currentWeather.main?.tempMax?.round() ?? 0}°C';

  @computed
  String get minTemp => '${_currentWeather.main?.tempMin?.round() ?? 0}°C';

  @computed
  String get windSpeed =>
      '${_currentWeather.wind?.speed?.round() ?? 0} ${_currentWeather.wind?.unit ?? ''}';

  @computed
  String get humidity => '${_currentWeather.main?.humidity ?? 0}%';

  @action
  void listenLocation() {
    locationStream.listen((position) async {
      _weatherFutureData =
          ObservableFuture(weatherServiceApi.fetchWeatherByLocation(
        position.latitude,
        position.longitude,
      ));

      _currentWeather = await _weatherFutureData;
    });
  }
}
