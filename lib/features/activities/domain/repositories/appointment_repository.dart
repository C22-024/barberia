import 'package:barberia/features/activities/domain/entities/appointment.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';

abstract class AppointmentRepository {
  Stream<Either<Failure, List<Appointment>>> getAppointments();
}
