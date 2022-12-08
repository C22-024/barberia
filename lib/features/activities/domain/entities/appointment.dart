import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment.freezed.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    required String id,
    required Map status,
    required Map user,
    required Map barbershop,
    List<Map>? services,
    int? userDefinedExpiry,
    int? timeStamp,
    Map? paymentDetails,
    Map? review,
  }) = _Appointment;

  const Appointment._();
}
