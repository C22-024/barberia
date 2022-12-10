import 'package:barberia/features/review/domain/entities/review.dart';

import 'package:barberia/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/review_repository.dart';
import '../datasources/review_remote_datasource.dart';
import '../models/review_model.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  const ReviewRepositoryImpl(this._datasource);

  final ReviewRemoteDatasource _datasource;
  @override
  Future<Either<Failure, Unit>> addReview(Review review) async {
    try {
      await _datasource.addReview(ReviewModel.fromDomain(review));
      return right(unit);
    } catch (e) {
      return left(Failure.unexpected(e.toString()));
    }
  }
}
