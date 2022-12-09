import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/appointment.dart';
import '../entities/transaction_token.dart';
import '../repositories/booking_repository.dart';

class GetTransactionToken {
  const GetTransactionToken(this._repository);

  final BookingRepository _repository;

  Future<Either<Failure, TransactionToken>> call(Appointment appointment) {
    return _repository.getTransactionToken(appointment);
  }
}
