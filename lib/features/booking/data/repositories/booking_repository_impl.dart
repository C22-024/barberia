import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/entities/transaction_token.dart';
import '../../domain/repositories/booking_repository.dart';
import '../datasources/booking_remote_datasource.dart';
import '../models/appointment_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  const BookingRepositoryImpl(this._bookingRemoteDatasource);

  final BookingRemoteDatasource _bookingRemoteDatasource;

  @override
  Future<Either<Failure, Unit>> createAppointment(
      Appointment appointment) async {
    try {
      await _bookingRemoteDatasource
          .createAppointment(AppointmentModel.fromDomain(appointment));
      return right(unit);
    } catch (e) {
      return left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionToken>> getTransactionToken(
    Appointment appointment,
  ) async {
    try {
      final result = await _bookingRemoteDatasource
          .getTransactionToken(AppointmentModel.fromDomain(appointment));
      return right(result.toDomain());
    } catch (e) {
      return left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getBPoinBalance(String userId) async {
    try {
      final result = await _bookingRemoteDatasource.getBPoinBalance(userId);
      return right(result);
    } catch (e) {
      return left(Failure.unexpected(e.toString()));
    }
  }
}
