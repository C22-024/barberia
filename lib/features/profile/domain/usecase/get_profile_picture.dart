import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../repositories/profile_user_repository.dart';

class GetProfilePicture {
  const GetProfilePicture(this._profileUserRepository);

  final ProfileUserRepository _profileUserRepository;

  Future<Either<Failure, Uint8List?>> call(String photoUrl) {
    return _profileUserRepository.getProfilePicture(photoUrl);
  }
}
