import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/appointment_status_code.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const factory Status({
    required AppointmentStatusCode code,
    required int updatedAt,
    String? message,
  }) = _Status;
}
