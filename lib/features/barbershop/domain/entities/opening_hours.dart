import 'package:freezed_annotation/freezed_annotation.dart';

import 'opening_hour.dart';

part 'opening_hours.freezed.dart';

@freezed
class OpeningHours with _$OpeningHours {
  const factory OpeningHours({
    required OpeningHour mon,
    required OpeningHour tue,
    required OpeningHour wed,
    required OpeningHour thu,
    required OpeningHour fri,
    required OpeningHour sat,
    required OpeningHour sun,
  }) = _OpeningHours;

  const OpeningHours._();

  OpeningHour getOpeningHour(String day) {
    switch (day.toLowerCase()) {
      case 'mon':
        return mon;
      case 'tue':
        return tue;
      case 'wed':
        return wed;
      case 'thu':
        return thu;
      case 'fri':
        return fri;
      case 'sat':
        return sat;
      default:
        return sun;
    }
  }
}
