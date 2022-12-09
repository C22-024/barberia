import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/opening_hours.dart';
import 'opening_hour_model.dart';

part 'opening_hours_model.freezed.dart';
part 'opening_hours_model.g.dart';

@freezed
class OpeningHoursModel with _$OpeningHoursModel {
  const factory OpeningHoursModel({
    required OpeningHourModel mon,
    required OpeningHourModel tue,
    required OpeningHourModel wed,
    required OpeningHourModel thu,
    required OpeningHourModel fri,
    required OpeningHourModel sat,
    required OpeningHourModel sun,
  }) = _OpeningHoursModel;

  const OpeningHoursModel._();

  factory OpeningHoursModel.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursModelFromJson(json);

  OpeningHours toDomain() {
    return OpeningHours(
      mon: mon.toDomain(),
      tue: tue.toDomain(),
      wed: wed.toDomain(),
      thu: thu.toDomain(),
      fri: fri.toDomain(),
      sat: sat.toDomain(),
      sun: sun.toDomain(),
    );
  }
}
