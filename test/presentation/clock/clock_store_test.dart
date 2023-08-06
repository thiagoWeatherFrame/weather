import 'package:flutter_test/flutter_test.dart';
import 'package:weather/presentation/clock/clock_store.dart';

void main() {
  late ClockStore clockStore;
  setUpAll(() {
    clockStore = ClockStore();
  });

  group('ClockStore', () {
    test('Should format date correctly', () {
      final date = DateTime(2021, 10, 10, 10, 10);
      final formattedDate = clockStore.formatDate(date);
      expect(formattedDate, '10 de Outubro 10:10');
    });

    test('Should start clock', () {
      clockStore.init();
      expect(clockStore.currentTime, isNotEmpty);
    });
  });
}
