import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:fpdart/fpdart.dart';

import '../../../../utils/firebase_user_mapper.dart';
import '../../domain/auth_failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_facade.dart';

class AuthFacadeImpl implements AuthFacade {
  AuthFacadeImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<Option<User>> getSignedInUser() async {
    return optionOf(_firebaseAuth.currentUser?.toDomainUser());
  }

  @override
  Future<Either<AuthFailure, Unit>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () =>
                throw TimeoutException('Operation timeout after 10 secs.'),
          );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return left(const AuthFailure.emailAlreadyInUse());
        case 'invalid-email':
          return left(const AuthFailure.invalidEmail());
        case 'weak-password':
          return left(const AuthFailure.weakPassword());
        default:
          return left(AuthFailure.unexpected(e.toString()));
      }
    } on TimeoutException {
      return left(const AuthFailure.timeout());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () =>
                throw TimeoutException('Operation timeout after 10 secs.'),
          );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
        case 'user-not-found':
        case 'wrong-password':
          return left(const AuthFailure.invalidEmailOrPassword());
        default:
          return left(AuthFailure.unexpected(e.toString()));
      }
    } on TimeoutException {
      return left(const AuthFailure.timeout());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email).timeout(
            const Duration(seconds: 10),
            onTimeout: () =>
                throw TimeoutException('Operation timeout after 10 secs.'),
          );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
        case 'user-not-found':
          return left(const AuthFailure.invalidEmail());
        default:
          return left(AuthFailure.unexpected(e.toString()));
      }
    } on TimeoutException {
      return left(const AuthFailure.timeout());
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
