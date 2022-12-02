import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../constants/firebase_exception_codes.dart';
import '../../../../failures/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._userRemoteDataSource);

  final UserRemoteDataSource _userRemoteDataSource;

  @override
  Stream<Either<Failure, User?>> getUserProfile(String userId) async* {
    yield* _userRemoteDataSource
        .getUserProfile(userId)
        .map((userModel) => right<Failure, User?>(userModel?.toDomain()))
        .onErrorReturnWith(
            (error, stackTrace) => left(Failure.unexpected(error.toString())));
  }

  @override
  Future<Either<Failure, Unit>> createUserProfile(User user) async {
    try {
      await _userRemoteDataSource.createUserProfile(UserModel.fromDomain(user));
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == FirebaseExceptionCodes.unavailable) {
        return left(const Failure.timeout());
      }
      return left(Failure.unexpected(e.toString()));
    } catch (e) {
      return left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture({
    required File picture,
    required String userId,
  }) async {
    try {
      final result = await _userRemoteDataSource.uploadProfilePicture(
        picture: picture,
        userId: userId,
      );
      return right(result);
    } on FirebaseException catch (e) {
      return left(Failure.unexpected(e.toString(), error: e));
    }
  }
}
