import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

part 'appointment_barbershop.freezed.dart';

@freezed
class AppointmentBarbershop with _$AppointmentBarbershop {
  const factory AppointmentBarbershop({
    required String id,
    required String name,
    required String address,
    required GeoFirePoint location,
  }) = _AppointmentBarbershop;
}
