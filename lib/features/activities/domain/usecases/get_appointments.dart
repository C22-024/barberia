import 'package:barberia/failures/failure.dart';
import 'package:barberia/features/activities/domain/entities/appointment.dart';
import 'package:barberia/features/activities/domain/repositories/appointment_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAppointments {
  const GetAppointments(this._appointmentRepository);

  final AppointmentRepository _appointmentRepository;

  Stream<Either<Failure, List<Appointment>>> execute(String userId) {
    return _appointmentRepository.getAppointments(userId);
  }
}
