import 'package:fpdart/fpdart.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:latlong2/latlong.dart';

import '../../../../failures/failure.dart';
import '../repositories/home_repository.dart';

class UpdateLastLocation {
  const UpdateLastLocation(this._homeRepository);

  final HomeRepository _homeRepository;

  Future<Either<Failure, Unit>> call({
    required String userId,
    required LatLng currentLocation,
  }) {
    final geoFirePoint = GeoFlutterFire().point(
      latitude: currentLocation.latitude,
      longitude: currentLocation.longitude,
    );
    return _homeRepository.updateLastLocation(
      userId: userId,
      currentLocation: geoFirePoint,
    );
  }
}
