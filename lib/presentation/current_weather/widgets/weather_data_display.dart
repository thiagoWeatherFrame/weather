import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../current_weather_store.dart';

enum WeatherData {
  humidity,
  maxTemp,
  minTemp,
  windVelocity,
}

class WeatherDataDisplay extends StatelessWidget {
  final WeatherData weatherData;
  final double? iconHeight;
  final double? iconWidth;

  const WeatherDataDisplay(
      {super.key,
      required this.weatherData,
      this.iconHeight = 40,
      this.iconWidth = 40});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentWeatherStore>(
      builder: (_, currentWeatherStore, __) => Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ListTile(
          dense: true,
          leading: buildIcon(),
          title: buildDisplayText(buildTitle()),
          subtitle: observerData(currentWeatherStore),
        ),
      ),
    );
  }

  String buildTitle() {
    switch (weatherData) {
      case WeatherData.humidity:
        return 'Umidade';
      case WeatherData.maxTemp:
        return 'Temp máx.';
      case WeatherData.minTemp:
        return 'Temp mín.';
      case WeatherData.windVelocity:
        return 'Vel. vento';
    }
  }

  Widget buildIcon() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30,
      child: SizedBox(
        width: iconWidth,
        height: iconHeight,
        child: ClipOval(
          child: Image.asset(
            'assets/image/${weatherData.name}.png',
          ),
        ),
      ),
    );
  }

  Observer observerData(CurrentWeatherStore currentWeatherStore) {
    switch (weatherData) {
      case WeatherData.humidity:
        return Observer(
          builder: (_) => buildDisplayText(currentWeatherStore.humidity),
        );
      case WeatherData.maxTemp:
        return Observer(
          builder: (_) => buildDisplayText(currentWeatherStore.maxTemp),
        );
      case WeatherData.minTemp:
        return Observer(
          builder: (_) => buildDisplayText(currentWeatherStore.minTemp),
        );
      case WeatherData.windVelocity:
        return Observer(
          builder: (_) => buildDisplayText(currentWeatherStore.windSpeed),
        );
    }
  }

  AutoSizeText buildDisplayText(String text) => AutoSizeText(text, maxLines: 1);
}
