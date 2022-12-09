import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_service.freezed.dart';

@freezed
class AppointmentService with _$AppointmentService {
  const factory AppointmentService({
    required String id,
    required String name,
    required int durationInMinutes,
    required int price,
  }) = _AppointmentService;
}
