import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_failure.freezed.dart';

@freezed
class ReviewFailure with _$ReviewFailure{
  const factory ReviewFailure.timeout() = _Timeout;
  const factory ReviewFailure.unexpected() = _Unexpected;
}