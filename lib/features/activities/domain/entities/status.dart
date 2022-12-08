import 'package:barberia/constants/appointment_status_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const factory Status({
    required AppointmentStatusCode code,
    required int updatedAt,
    String? message,
  }) = _Status;
}
