import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_payment_detail.freezed.dart';
part 'appointment_payment_detail.g.dart';

@freezed
class AppointmentPaymentDetail with _$AppointmentPaymentDetail {
  const factory AppointmentPaymentDetail({
    required String id,
    required String name,
    required int amount,
  }) = _AppointmentPaymentDetail;

  factory AppointmentPaymentDetail.fromJson(Map<String, dynamic> json) =>
      _$AppointmentPaymentDetailFromJson(json);
}
