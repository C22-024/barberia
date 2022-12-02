import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Stream<Either<Failure, User?>> getUserProfile(String userId);
  Future<Either<Failure, Unit>> createUserProfile(User user);
  Future<Either<Failure, String>> uploadProfilePicture({
    required File picture,
    required String userId,
  });
}
