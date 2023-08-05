import 'package:flutter/material.dart';
import 'package:weather/constants/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Placeholder(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: const Text(Strings.homeTitle),
    );
  }
}
