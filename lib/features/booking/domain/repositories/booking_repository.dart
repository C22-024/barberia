import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/appointment.dart';
import '../entities/transaction_token.dart';

abstract class BookingRepository {
  Future<Either<Failure, TransactionToken>> getTransactionToken(
    Appointment appointment,
  );
  Future<Either<Failure, Unit>> createAppointment(Appointment appointment);
  Future<Either<Failure, int>> getBPoinBalance(String userId);
}
