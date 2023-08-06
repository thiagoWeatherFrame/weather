import 'package:flutter/material.dart';
import 'package:weather/presentation/routes.dart';

import '../constants/strings.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blueGrey,
        canvasColor: const Color(0xFF5c7eef),
      ),
      initialRoute: Routes.bootstrap,
      routes: Routes.routes,
    );
  }
}
