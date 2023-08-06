class LocationServiceException implements Exception {
  String message;

  LocationServiceException(this.message);
}

class PermissionDisabledException extends LocationServiceException {
  PermissionDisabledException(String message) : super(message);
}

class UserDeniedPermissionException extends LocationServiceException {
  UserDeniedPermissionException(String message) : super(message);
}

class PermissionDeniedForEverException extends LocationServiceException {
  PermissionDeniedForEverException(String message) : super(message);
}
