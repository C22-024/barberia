import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required String id,
    required String name,
    required int durationInMinutes,
    required int price,
  }) = _Service;
}
