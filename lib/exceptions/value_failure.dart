import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure {
  const factory ValueFailure(
    T value, {
    String? message,
  }) = _ValueFailure;
}
