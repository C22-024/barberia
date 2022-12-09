import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_payment_channel.freezed.dart';
part 'appointment_payment_channel.g.dart';

@freezed
class AppointmentPaymentChannel with _$AppointmentPaymentChannel {
  const factory AppointmentPaymentChannel({
    required String name,
    required int amount,
  }) = _AppointmentPaymentChannel;

  factory AppointmentPaymentChannel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentPaymentChannelFromJson(json);
}
