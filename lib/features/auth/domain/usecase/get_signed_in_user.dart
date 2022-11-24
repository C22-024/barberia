import 'package:fpdart/fpdart.dart';

import '../entities/user.dart';
import '../repositories/auth_facade.dart';

class GetSignedInUser {
  const GetSignedInUser(this.authFacade);

  final AuthFacade authFacade;

  Future<Option<User>> call() {
    return authFacade.getSignedInUser();
  }
}
