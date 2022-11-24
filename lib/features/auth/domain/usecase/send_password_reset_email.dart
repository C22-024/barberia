import 'package:fpdart/fpdart.dart';

import '../auth_failure.dart';
import '../repositories/auth_facade.dart';

class SendPasswordResetEmail {
  const SendPasswordResetEmail(this.authFacade);

  final AuthFacade authFacade;

  Future<Either<AuthFailure, Unit>> call(String email) {
    return authFacade.sendPasswordResetEmail(email);
  }
}
