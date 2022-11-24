import 'dart:ffi';

import 'package:barberia/features/review/domain/entities/review.dart';

abstract class ReviewRepository {
  Future<void> addReview(Review review);
}