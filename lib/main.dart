import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/clock/clock_store.dart';
import 'package:weather/presentation/current_weather/current_weather_store.dart';
import 'package:weather/presentation/weather_app.dart';

import 'firebase_options.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureFirebase();
  await configureDependencies(environment: prod);
  runApp(MultiProvider(providers: [
    Provider<CurrentWeatherStore>(
      create: (_) => getIt<CurrentWeatherStore>()..listenLocation(),
    ),
    Provider<ClockStore>(
      create: (_) => getIt<ClockStore>()..init(),
    ),
  ], child: const WeatherApp()));
}

Future<void> _configureFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
