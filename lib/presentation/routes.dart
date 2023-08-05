import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather/presentation/home/home_screen.dart';

class Routes {
  Routes._();

  static const String signin = '/sign-in';
  static const String profile = '/profile';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    signin: (BuildContext context) => SignInScreen(
          actions: [
            AuthStateChangeAction<SignedIn>((context, state) {
              Navigator.pushReplacementNamed(context, '/home');
            }),
          ],
        ),
    profile: (BuildContext context) => ProfileScreen(
          actions: [
            SignedOutAction((context) {
              Navigator.pushReplacementNamed(context, '/sign-in');
            }),
          ],
        ),
    home: (BuildContext context) => const HomeScreen(),
  };
}
