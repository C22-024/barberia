import 'package:fpdart/fpdart.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../failures/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, Unit>> updateLastLocation({
    required String userId,
    required GeoFirePoint currentLocation,
  });
}
