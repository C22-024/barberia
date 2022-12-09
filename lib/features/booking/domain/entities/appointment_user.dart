import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_user.freezed.dart';

@freezed
class AppointmentUser with _$AppointmentUser {
  const factory AppointmentUser({
    required String id,
    required String name,
  }) = _AppointmentUser;
}
