import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/review.dart';
import '../repositories/review_repository.dart';

class AddReview {
  final ReviewRepository repository;

  AddReview(this.repository);

  Future<Either<Failure, Unit>> call(Review review) {
    return repository.addReview(review);
  }
}
