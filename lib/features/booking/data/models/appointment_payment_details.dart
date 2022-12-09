import 'package:barberia/constants/business_amounts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/appointment.dart';
import 'appointment_payment_channel.dart';
import 'appointment_payment_detail.dart';

part 'appointment_payment_details.freezed.dart';
part 'appointment_payment_details.g.dart';

@freezed
class AppointmentPaymentDetails with _$AppointmentPaymentDetails {
  const factory AppointmentPaymentDetails({
    required List<AppointmentPaymentDetail> details,
    required List<AppointmentPaymentChannel> channels,
  }) = _AppointmentPaymentDetails;

  factory AppointmentPaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$AppointmentPaymentDetailsFromJson(json);

  factory AppointmentPaymentDetails.fromDomain(Appointment appointment) {
    List<AppointmentPaymentChannel> channels = [];

    if (appointment.payWithBPoinAmount > 0) {
      channels.add(AppointmentPaymentChannel(
        name: 'BPoin',
        amount: appointment.payWithBPoinAmount,
      ));
    }

    final serviceDetails = appointment.services.map(
      (e) => AppointmentPaymentDetail(id: e.id, name: e.name, amount: e.price),
    );

    final details = [
      ...serviceDetails,
      const AppointmentPaymentDetail(
          id: 'appointment-fee',
          name: 'Biaya Penanganan',
          amount: BusinessAmounts.appointmentFee),
    ];

    return AppointmentPaymentDetails(details: details, channels: channels);
  }
}
