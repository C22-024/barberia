import 'package:barberia/failures/failure.dart';
import 'package:barberia/features/review/domain/entities/review.dart';
import 'package:fpdart/fpdart.dart';

abstract class ReviewRepository {
  Future<Either<Failure, Unit>> addReview(Review review);
}
