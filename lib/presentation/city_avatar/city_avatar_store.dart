import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';

import 'package:weather/services/city_image_service_api.dart';
import 'package:weather/services/city_image_service_api_impl.dart';

part 'city_avatar_store.g.dart';

@injectable
// ignore: library_private_types_in_public_api
class CityAvatarStore = _CityAvatarStore with _$CityAvatarStore;

abstract class _CityAvatarStore with Store {
  final ICityImageServiceApi _cityImageServiceApi;

  String lastCityName = '';

  _CityAvatarStore(this._cityImageServiceApi);

  init() {
    fetchImageUrlByQuery('Belo horizonte');
  }

  @observable
  String imageUrl = kDefaultImageUrl;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchImageUrlByQuery(String query) async {
    isLoading = true;
    imageUrl = await _cityImageServiceApi.fetchImageUrlByQuery(query);
    isLoading = false;
  }
}
