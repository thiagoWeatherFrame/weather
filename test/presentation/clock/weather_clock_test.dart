import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/clock/clock_store.dart';
import 'package:weather/presentation/clock/weather_clock.dart';

void main() {
  testWidgets('WeatherClock renders the current time', (tester) async {
    final clockStore = ClockStore();
    const currentTime = '12:34 PM';
    clockStore.currentTime = currentTime;

    await tester.pumpWidget(
      MaterialApp(
        home: Provider<ClockStore>(
          create: (_) => clockStore,
          child: const WeatherClock(),
        ),
      ),
    );

    expect(find.text(currentTime), findsOneWidget);
  });
}
