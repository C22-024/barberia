import 'package:barberia/features/review/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

@freezed
class Review with _$Review{
  const factory Review({
    required String appointmentId,
    required String barbershopId,
    required double rate,
    required User user,
    String? content,
  }) = _Review;
}