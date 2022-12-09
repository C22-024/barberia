import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/appointment.dart';
import 'appointment_barbershop_model.dart';
import 'appointment_payment_details.dart';
import 'appointment_service_model.dart';
import 'appointment_user_model.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@freezed
class AppointmentModel with _$AppointmentModel {
  const factory AppointmentModel({
    required String id,
    required AppointmentUserModel user,
    required AppointmentBarbershopModel barbershop,
    required List<AppointmentServiceModel> services,
    required int timestamp,
    required AppointmentPaymentDetails paymentDetails,
  }) = _AppointmentModel;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  factory AppointmentModel.fromDomain(Appointment appointment) {
    return AppointmentModel(
      id: appointment.id,
      user: AppointmentUserModel.fromDomain(appointment.user),
      barbershop: AppointmentBarbershopModel.fromDomain(appointment.barbershop),
      services: appointment.services
          .map((e) => AppointmentServiceModel.fromDomain(e))
          .toList(),
      timestamp: appointment.timestamp,
      paymentDetails: AppointmentPaymentDetails.fromDomain(appointment),
    );
  }
}
