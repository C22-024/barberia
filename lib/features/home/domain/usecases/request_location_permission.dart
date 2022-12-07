import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../failures/geolocator_failure.dart';

class RequestLocationPermission {
  const RequestLocationPermission();

  Future<Either<GeolocatorFailure, Unit>> call() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) return left(const GeolocatorFailure.serviceDisabled());

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      try {
        permission = await Geolocator.requestPermission();
      } catch (e) {
        return left(const GeolocatorFailure.permissionDenied());
      }
    }

    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      return left(const GeolocatorFailure.permissionDenied());
    }

    return right(unit);
  }
}
