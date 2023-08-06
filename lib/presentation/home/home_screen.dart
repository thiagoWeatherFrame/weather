import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/city_avatar/city_avatar.dart';
import 'package:weather/presentation/clock/weather_clock.dart';
import 'package:weather/presentation/current_weather/current_weather_store.dart';
import 'package:weather/presentation/current_weather/widgets/weather_data_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildScreen() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildScreenHeader(),
        buildWeatherInfoCard(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: buildThemeData(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: SafeArea(
          child: buildScreen(),
        ),
      ),
    );
  }

  ThemeData buildThemeData(BuildContext context) {
    return Theme.of(context).copyWith(
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
      cardTheme: CardTheme(
        elevation: 0,
        shadowColor: Colors.transparent,
        color: Theme.of(context).canvasColor,
      ),
    );
  }

  Padding buildWeatherInfoHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        'Climatempo',
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }

  Expanded buildScreenHeader() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 55.0, left: 8),
            child: buildLocationInfo(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Image(image: AssetImage('assets/image/sun.png')),
          ),
        ],
      ),
    );
  }

  Column buildLocationInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: buildCityName(),
        ),
        Flexible(
          child: buildDateTime(),
        ),
      ],
    );
  }

  Padding buildDateTime() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: WeatherClock(),
    );
  }

  Widget buildCityName() {
    return Consumer<CurrentWeatherStore>(builder:
        (BuildContext context, CurrentWeatherStore store, Widget? child) {
      return Observer(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(
            store.cityName,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      );
    });
  }

  Widget buildWeatherInfoCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            const FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Align(
                alignment: FractionalOffset(0.5, 0.0),
                child: CityAvatar(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                border: Border.all(
                  color: Colors.white, // Set the white color for the border
                  width: 2.0, // Set the border width
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28.0),
                  topRight: Radius.circular(28.0),
                ),
                child: Container(
                  height: 250.0,
                  color: const Color(0xFF6e6f82),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildWeatherInfoHeader(),
                        ],
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: WeatherDataDisplay(
                              weatherData: WeatherData.maxTemp,
                            ),
                          ),
                          Expanded(
                            child: WeatherDataDisplay(
                              weatherData: WeatherData.minTemp,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: WeatherDataDisplay(
                              weatherData: WeatherData.windVelocity,
                            ),
                          ),
                          Expanded(
                            child: WeatherDataDisplay(
                              weatherData: WeatherData.humidity,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
