import 'package:barberia/features/review/data/models/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../../utils/firebase_extensions.dart';

abstract class ReviewRemoteDatasource {
  Future<void> addReview(ReviewModel reviewModel);
}

class ReviewRemoteDatasourceImpl implements ReviewRemoteDatasource {
  const ReviewRemoteDatasourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<void> addReview(ReviewModel reviewModel) async {
    final appointmentDocRef =
        _firestore.appointmentDocRef(reviewModel.appointmentId);
    final reviewDocRef = _firestore.reviewColRef.doc(reviewModel.appointmentId);
    await _firestore.runTransaction((transaction) async {
      transaction.set(reviewDocRef, reviewModel.toJson());
      transaction.update(appointmentDocRef, {
        'review': {
          'rate': reviewModel.rate,
          'content': reviewModel.content,
        },
      });
    });
  }
}
