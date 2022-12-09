import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/appointment_status_code.dart';

part 'appointment_status_model.freezed.dart';
part 'appointment_status_model.g.dart';

@freezed
class AppointmentStatusModel with _$AppointmentStatusModel {
  const factory AppointmentStatusModel({
    required AppointmentStatusCode code,
    required int updatedAt,
    String? message,
  }) = _AppointmentStatusModel;

  factory AppointmentStatusModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentStatusModelFromJson(json);
}
