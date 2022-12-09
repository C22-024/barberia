import 'package:freezed_annotation/freezed_annotation.dart';

import 'appointment_barbershop.dart';
import 'appointment_service.dart';
import 'appointment_user.dart';

part 'appointment.freezed.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    required String id,
    required AppointmentUser user,
    required AppointmentBarbershop barbershop,
    required List<AppointmentService> services,
    required int timestamp,
    required int payWithBPoinAmount,
  }) = _Appointment;
}
