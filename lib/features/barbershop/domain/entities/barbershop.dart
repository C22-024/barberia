import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import 'opening_hours.dart';

part 'barbershop.freezed.dart';

@freezed
class Barbershop with _$Barbershop {
  const factory Barbershop({
    required String id,
    required String name,
    required String address,
    required GeoFirePoint location,
    required int completedAppointmentCount,
    required double rating,
    required int reviewCount,
    required bool closedManually,
    required OpeningHours openingHours,
    required double distance,
    String? photoUrl,
    String? bannerUrl,
  }) = _Barbershop;
}
