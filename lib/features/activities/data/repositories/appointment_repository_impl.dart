import 'package:fpdart/fpdart.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../failures/failure.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment_remote_data_source.dart';

class AppointmentRepositoryImpl extends AppointmentRepository {
  AppointmentRepositoryImpl(this._appointmentRemoteDataSource);

  final AppointmentRemoteDataSource _appointmentRemoteDataSource;

  @override
  Stream<Either<Failure, List<Appointment>>> getAppointments(
      String userId) async* {
    yield* _appointmentRemoteDataSource
        .getAppointments(userId)
        .map((appointmentModel) =>
            right<Failure, List<Appointment>>(appointmentModel
                .map(
                  (e) => e.toDomain(),
                )
                .toList()))
        .onErrorReturnWith(
            (error, stackTrace) => left(Failure.unexpected(error.toString())));
  }
}
