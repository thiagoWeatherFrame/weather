// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClockStore on _ClockStore, Store {
  late final _$currentTimeAtom =
      Atom(name: '_ClockStore.currentTime', context: context);

  @override
  String get currentTime {
    _$currentTimeAtom.reportRead();
    return super.currentTime;
  }

  @override
  set currentTime(String value) {
    _$currentTimeAtom.reportWrite(value, super.currentTime, () {
      super.currentTime = value;
    });
  }

  late final _$_ClockStoreActionController =
      ActionController(name: '_ClockStore', context: context);

  @override
  void _updateClock() {
    final _$actionInfo = _$_ClockStoreActionController.startAction(
        name: '_ClockStore._updateClock');
    try {
      return super._updateClock();
    } finally {
      _$_ClockStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTime: ${currentTime}
    ''';
  }
}
