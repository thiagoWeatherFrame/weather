import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:weather/injection.dart';
import 'package:weather/presentation/city_avatar/city_avatar_store.dart';
import 'package:weather/presentation/current_weather/current_weather_store.dart';

class CityAvatar extends StatelessWidget {
  const CityAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<CityAvatarStore>(
      create: (_) => getIt<CityAvatarStore>()..init(),
      child: Consumer2<CityAvatarStore, CurrentWeatherStore>(
        builder: (_, store, weather, __) => Observer(
          builder: (BuildContext context) {
            if (weather.cityName != store.lastCityName) {
              store.fetchImageUrlByQuery(weather.cityName);
            }
            return Center(
              child: SizedBox(
                width: 360.0,
                height: 360.0,
                child: ClipOval(
                  child: Observer(
                    builder: (_) => CachedNetworkImage(
                      imageUrl: store.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
