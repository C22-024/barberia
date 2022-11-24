import 'package:fpdart/fpdart.dart';

import '../auth_failure.dart';
import '../repositories/auth_facade.dart';

class CreateUserWithEmailAndPassword {
  const CreateUserWithEmailAndPassword(this.authFacade);

  final AuthFacade authFacade;

  Future<Either<AuthFailure, Unit>> call({
    required String email,
    required String password,
  }) {
    return authFacade.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
