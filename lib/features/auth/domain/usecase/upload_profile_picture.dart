import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../repositories/user_repository.dart';

class UploadProfilePicture {
  const UploadProfilePicture(this._userRepository);

  final UserRepository _userRepository;

  Future<Either<Failure, String>> call({
    required File picture,
    required String userId,
  }) {
    return _userRepository.uploadProfilePicture(
      picture: picture,
      userId: userId,
    );
  }
}
