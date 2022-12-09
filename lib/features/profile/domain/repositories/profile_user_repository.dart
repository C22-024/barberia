import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../../../auth/domain/entities/user.dart';

abstract class ProfileUserRepository {
  Future<Either<Failure, Uint8List?>> getProfilePicture(String photoUrl);
  Future<Either<Failure, Unit>> updateUserProfile(User user);
}
