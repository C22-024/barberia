import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../constants/firebase_exception_codes.dart';
import '../../../../failures/failure.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../auth/domain/entities/user.dart';
import '../../domain/repositories/profile_user_repository.dart';
import '../datasource/profile_user_remote_data_source.dart';

class ProfileUserRepositoryImpl extends ProfileUserRepository {
  ProfileUserRepositoryImpl(this._profileUserRemoteDataSource);

  final ProfileUserRemoteDataSource _profileUserRemoteDataSource;

  @override
  Future<Either<Failure, Uint8List?>> getProfilePicture(String photoUrl) async {
    try {
      final uint8ListPhotoProfile = await _profileUserRemoteDataSource.getProfilePicture(photoUrl);
      return right(uint8ListPhotoProfile);
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
  Future<Either<Failure, Unit>> updateUserProfile(User user) async {
    try {
      await _profileUserRemoteDataSource.updateUserProfile(UserModel.fromDomain(user));
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
}
