import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../repositories/booking_repository.dart';

class GetBpoinBalance {
  const GetBpoinBalance(this._repository);

  final BookingRepository _repository;

  Future<Either<Failure, int>> call(String userId) {
    return _repository.getBPoinBalance(userId);
  }
}
