import 'package:fpdart/fpdart.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../failures/failure.dart';
import '../entitites/barbershop_overview.dart';

abstract class HomeRepository {
  Future<Either<Failure, Unit>> updateLastLocation({
    required String userId,
    required GeoFirePoint currentLocation,
  });
  Stream<Either<Failure, int>> getCurrentBalance(String userId);
  Stream<Either<Failure, List<BarbershopOverview>>> getNearestBarbershops(
      GeoFirePoint userLocation);
}
