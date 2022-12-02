import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Possible [Failure]: <br>
/// - **unexpected**
class GetUserProfile {
  const GetUserProfile(this._userRepository);

  final UserRepository _userRepository;

  Stream<Either<Failure, User?>> call(String userId) async* {
    yield* _userRepository.getUserProfile(userId);
  }
}
