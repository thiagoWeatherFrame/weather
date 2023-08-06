import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'clock_store.dart';

class WeatherClock extends StatelessWidget {
  const WeatherClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ClockStore>(
      builder: (_, clockStore, __) => Observer(
        builder: (_) => AutoSizeText(
          clockStore.currentTime,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
