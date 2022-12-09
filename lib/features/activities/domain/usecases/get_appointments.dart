import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

class GetAppointments {
  const GetAppointments(this._appointmentRepository);

  final AppointmentRepository _appointmentRepository;

  Stream<Either<Failure, List<Appointment>>> execute(String userId) {
    return _appointmentRepository.getAppointments(userId);
  }
}
