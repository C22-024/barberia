import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/appointment.dart';
import '../repositories/booking_repository.dart';

class CreateAppointment {
  const CreateAppointment(this._repository);

  final BookingRepository _repository;

  Future<Either<Failure, Unit>> call(Appointment appointment) {
    return _repository.createAppointment(appointment);
  }
}
