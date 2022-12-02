import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Possible [Failure]s: <br>
/// - **timeout**
/// - **unexpected**
class CreateUserProfile {
  const CreateUserProfile(this._userRepository);

  final UserRepository _userRepository;

  Future<Either<Failure, Unit>> call(User user) {
    return _userRepository.createUserProfile(user);
  }
}
