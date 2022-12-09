import 'package:barberia/features/review/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/review.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required String appointmentId,
    required String barbershopId,
    required double rate,
    required UserModel user,
    String? content,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  factory ReviewModel.fromDomain(Review review) {
    return ReviewModel(
      appointmentId: review.appointmentId,
      barbershopId: review.barbershopId,
      rate: review.rate,
      user: UserModel.fromDomain(review.user),
      content: review.content,
    );
  }
}
