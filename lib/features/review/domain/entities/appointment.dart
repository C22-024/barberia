import 'package:barberia/features/review/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment.freezed.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    required String id,
    required String barbershopId,
    required String barbershopName,
    required User user,
    required int timestamp,
  }) = _Appointment;
}
