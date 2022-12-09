import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/appointment.dart';

abstract class AppointmentRepository {
  Stream<Either<Failure, List<Appointment>>> getAppointments(String userId);
}
