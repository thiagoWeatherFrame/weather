import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'bootstrap_store.g.dart';

@injectable
// ignore: library_private_types_in_public_api
class BootstrapStore = _BootstrapStore with _$BootstrapStore;

abstract class _BootstrapStore with Store {
  @observable
  ObservableFuture<bool> hasLocationPermission = ObservableFuture.value(false);

  void init() async {
    hasLocationPermission = ObservableFuture(_checkLocationPermission());
  }

  Future<bool> _checkLocationPermission() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      final permissionRequest = await Geolocator.checkPermission();
      return permissionRequest == LocationPermission.whileInUse ||
          permissionRequest == LocationPermission.always;
    } else if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
      final permissionRequest = await Geolocator.checkPermission();
      return permissionRequest == LocationPermission.whileInUse ||
          permissionRequest == LocationPermission.always;
    }
    final permissionRequest = await Geolocator.checkPermission();
    return permissionRequest == LocationPermission.whileInUse ||
        permissionRequest == LocationPermission.always;
  }

  Future openAppSettings() async {
    await Geolocator.openAppSettings();
  }
}
