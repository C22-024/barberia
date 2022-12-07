import 'package:geolocator/geolocator.dart';

class GetGPSLocation {
  const GetGPSLocation();

  Stream<Position> call() {
    return Geolocator.getPositionStream(
      locationSettings:
          const LocationSettings(accuracy: LocationAccuracy.medium),
    );
  }
}
