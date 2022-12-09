import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/service.dart';
import '../repositories/barbershop_repository.dart';

class GetBarbershopServices {
  const GetBarbershopServices(this._repository);

  final BarbershopRepository _repository;

  Future<Either<Failure, List<Service>>> call(String barbershopId) {
    return _repository.getBarbershopServices(barbershopId);
  }
}
