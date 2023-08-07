// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_avatar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CityAvatarStore on _CityAvatarStore, Store {
  late final _$imageUrlAtom =
      Atom(name: '_CityAvatarStore.imageUrl', context: context);

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CityAvatarStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchImageUrlByQueryAsyncAction =
      AsyncAction('_CityAvatarStore.fetchImageUrlByQuery', context: context);

  @override
  Future<void> fetchImageUrlByQuery(String query) {
    return _$fetchImageUrlByQueryAsyncAction
        .run(() => super.fetchImageUrlByQuery(query));
  }

  @override
  String toString() {
    return '''
imageUrl: ${imageUrl},
isLoading: ${isLoading}
    ''';
  }
}
