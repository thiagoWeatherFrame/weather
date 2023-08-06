import 'package:flutter/material.dart';
import 'package:weather/presentation/bootstrap/bootstrap_screen.dart';
import 'package:weather/presentation/home/home_screen.dart';

class Routes {
  Routes._();

  static const String bootstrap = '/bootstrap';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    bootstrap: (BuildContext context) => const BootstrapScreen(),
    home: (BuildContext context) => const HomeScreen(),
  };
}
