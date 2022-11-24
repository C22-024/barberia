import '../entities/review.dart';
import '../repositories/review_repository.dart';

class AddReview{
  final ReviewRepository repository;

  AddReview(this.repository);

  Future<void> call(Review review) {
    return repository.addReview(review);
  }
}