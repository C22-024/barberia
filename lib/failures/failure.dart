import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.timeout() = _Timeout;
  const factory Failure.unexpected(
    String message, {
    Exception? error,
    StackTrace? stackTrace,
  }) = _Unexpected;
}
