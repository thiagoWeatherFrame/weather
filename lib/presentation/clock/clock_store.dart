import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';

part 'clock_store.g.dart';

@injectable
// ignore: library_private_types_in_public_api
class ClockStore = _ClockStore with _$ClockStore;

abstract class _ClockStore with Store {
  @observable
  String currentTime = '';

  init() {
    _updateClock();
    _startTimer();
  }

  @action
  void _updateClock() {
    final now = DateTime.now();
    final formattedTime = formatDate(now);
    currentTime = "Hoje, $formattedTime";
  }

  String formatDate(DateTime now) =>
      "${now.day} de ${_getMonthName(now.month)} ${_formatTwoDigits(now.hour)}:${_formatTwoDigits(now.minute)}";

  String _getMonthName(int month) {
    final List<String> monthNames = [
      "", // Index 0 is unused since months are 1-based
      "Janeiro",
      "Fevereiro",
      "Março",
      "Abril",
      "Maio",
      "Junho",
      "Julho",
      "Agosto",
      "Setembro",
      "Outubro",
      "Novembro",
      "Dezembro",
    ];
    return monthNames[month];
  }

  String _formatTwoDigits(int value) {
    return value.toString().padLeft(2, '0');
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 59), (_) {
      _updateClock();
    });
  }
}
