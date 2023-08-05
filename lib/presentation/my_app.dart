import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather/presentation/routes.dart';

import '../constants/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.blueGrey),
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? Routes.signin
              : Routes.profile,
          routes: Routes.routes,
        );
      },
    );
  }
}
