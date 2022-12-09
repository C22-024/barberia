import 'package:fpdart/fpdart.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../failures/failure.dart';
import '../entities/barbershop.dart';
import '../repositories/barbershop_repository.dart';

class GetBarbershop {
  const GetBarbershop(this._repository);

  final BarbershopRepository _repository;

  Future<Either<Failure, Barbershop>> call(
    String id,
    GeoFirePoint userLocation,
  ) {
    return _repository.getBarbershop(id, userLocation);
  }
}
