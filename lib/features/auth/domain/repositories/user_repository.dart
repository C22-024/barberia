import 'package:fpdart/fpdart.dart';

import '../../../../exceptions/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Stream<Either<Failure, User>> getUserProfile(String userId);
  Future<Either<Failure, Unit>> createUserProfile(User user);
}
