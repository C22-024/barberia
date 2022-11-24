import 'package:fpdart/fpdart.dart';

import '../auth_failure.dart';
import '../entities/user.dart';

abstract class AuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, Unit>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(String email);
  Future<void> signOut();
}
