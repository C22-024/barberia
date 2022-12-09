import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/appointment_service.dart';

part 'appointment_service_model.freezed.dart';
part 'appointment_service_model.g.dart';

@freezed
class AppointmentServiceModel with _$AppointmentServiceModel {
  const factory AppointmentServiceModel({
    required String id,
    required String name,
    required int durationInMinutes,
    required int price,
  }) = _AppointmentServiceModel;

  factory AppointmentServiceModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentServiceModelFromJson(json);

  factory AppointmentServiceModel.fromDomain(AppointmentService service) {
    return AppointmentServiceModel(
      id: service.id,
      name: service.name,
      durationInMinutes: service.durationInMinutes,
      price: service.price,
    );
  }
}
