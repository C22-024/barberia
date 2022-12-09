import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../../../auth/domain/entities/user.dart';
import '../repositories/profile_user_repository.dart';

class UpdateUserProfile {
  const UpdateUserProfile(this._profileUserRepository);

  final ProfileUserRepository _profileUserRepository;

  Future<Either<Failure, Unit>> call(User user) {
    return _profileUserRepository.updateUserProfile(user);
  }
}
