part of 'appoinment_getter_bloc.dart';

@freezed
class AppoinmentGetterEvent with _$AppoinmentGetterEvent {
  const factory AppoinmentGetterEvent.getAllStarted() = _GetAllStarted;
  const factory AppoinmentGetterEvent.appointmentsReceived(
          Either<Failure, List<Appointment>> failureOrAppointments) =
      _AppointmentsReceived;
}
