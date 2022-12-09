import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/opening_hour.dart';

part 'opening_hour_model.freezed.dart';
part 'opening_hour_model.g.dart';

@freezed
class OpeningHourModel with _$OpeningHourModel {
  const factory OpeningHourModel({
    required bool isOpen,
    int? openTime,
    int? closeTime,
  }) = _OpeningHourModel;

  const OpeningHourModel._();

  factory OpeningHourModel.fromJson(Map<String, dynamic> json) =>
      _$OpeningHourModelFromJson(json);

  OpeningHour toDomain() {
    return OpeningHour(
      isOpen: isOpen,
      openTime: openTime,
      closeTime: closeTime,
    );
  }
}
