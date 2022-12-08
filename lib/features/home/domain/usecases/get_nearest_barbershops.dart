import 'package:fpdart/fpdart.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../failures/failure.dart';
import '../entitites/barbershop_overview.dart';
import '../repositories/home_repository.dart';

class GetNearestBarbershops {
  const GetNearestBarbershops(this._homeRepository);

  final HomeRepository _homeRepository;

  Stream<Either<Failure, List<BarbershopOverview>>> call(
    GeoFirePoint userLocation,
  ) {
    return _homeRepository.getNearestBarbershops(userLocation);
  }
}
