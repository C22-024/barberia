import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_hour.freezed.dart';

@freezed
class OpeningHour with _$OpeningHour {
  const factory OpeningHour({
    required bool isOpen,
    int? openTime,
    int? closeTime,
  }) = _OpeningHour;
}
