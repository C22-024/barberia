import '../repositories/auth_facade.dart';

class SignOut {
  const SignOut(this.authFacade);

  final AuthFacade authFacade;

  Future<void> call() {
    return authFacade.signOut();
  }
}
