import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/exception/location_service_exceptions.dart';

@prod
@singleton
class LocationService {
  Stream<Position> get servicePositionStream {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 10,
      ),
    );
  }

  Future<Position> getCurrentLocation() async {
    await requestPermission();
    return await Geolocator.getCurrentPosition();
  }

  Future<void> requestPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw PermissionDisabledException(
          'Por favor, habilite a localização para receber a previsão de tempo do seu local.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw UserDeniedPermissionException(
            'Habilite a permissão de localização para receber a previsão de tempo do seu local.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw PermissionDeniedForEverException(
          'Habilite a permissão de localização para receber a previsão de tempo do seu local.');
    }
  }
}
