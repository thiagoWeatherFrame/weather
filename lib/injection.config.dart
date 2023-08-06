// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/di/di_data_modules.dart' as _i13;
import 'presentation/bootstrap/bootstrap_store.dart' as _i3;
import 'presentation/city_avatar/city_avatar_store.dart' as _i8;
import 'presentation/clock/clock_store.dart' as _i4;
import 'presentation/current_weather/current_weather_store.dart' as _i12;
import 'services/city_image_service_api.dart' as _i5;
import 'services/city_image_service_api_impl.dart' as _i6;
import 'services/location_service.dart' as _i7;
import 'services/weather_service_api.dart' as _i10;
import 'services/weather_service_api_impl.dart' as _i11;

const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerDataModule = _$RegisterDataModule();
    gh.factory<_i3.BootstrapStore>(() => _i3.BootstrapStore());
    gh.factory<_i4.ClockStore>(() => _i4.ClockStore());
    gh.factory<_i5.ICityImageServiceApi>(() => _i6.CityImageServiceApi());
    gh.singleton<_i7.LocationService>(
      _i7.LocationService(),
      registerFor: {_prod},
    );
    gh.factory<String>(
      () => registerDataModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i8.CityAvatarStore>(
        () => _i8.CityAvatarStore(gh<_i5.ICityImageServiceApi>()));
    gh.lazySingleton<_i9.Dio>(
        () => registerDataModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i10.IWeatherServiceApi>(
        () => _i11.WeatherServiceApi(gh<_i9.Dio>()));
    gh.factory<_i12.CurrentWeatherStore>(() => _i12.CurrentWeatherStore(
          gh<_i10.IWeatherServiceApi>(),
          gh<_i7.LocationService>(),
        ));
    return this;
  }
}

class _$RegisterDataModule extends _i13.RegisterDataModule {}
