import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

import '../../../../constants/firebase_storage_paths.dart';
import '../../../../utils/firebase_extensions.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Stream<UserModel?> getUserProfile(String userId);
  Future<void> createUserProfile(UserModel userModel);
  Future<String> uploadProfilePicture({
    required File picture,
    required String userId,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  const UserRemoteDataSourceImpl(this._firestore, this._firebaseStorage);

  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  @override
  Stream<UserModel?> getUserProfile(String userId) async* {
    yield* _firestore.userDocRef(userId).snapshots().map((doc) {
      if (!doc.exists) {
        // Firestore is unreachable
        if (doc.metadata.isFromCache) {
          throw FirebaseException(plugin: 'Firestore', code: 'UNAVAILABLE');
        }

        // No user profile yet
        return null;
      }

      return UserModel.fromFirestore(
        doc as DocumentSnapshot<Map<String, dynamic>>,
      );
    });
  }

  @override
  Future<void> createUserProfile(UserModel userModel) async {
    final batch = _firestore.batch();
    final userDocRef = _firestore.userDocRef(userModel.id!);
    final pointBalanceDocRef = _firestore.pointBalanceDocRef(userModel.id!);

    batch.set(userDocRef, userModel.toJson());
    batch.set(pointBalanceDocRef, {'currentBalance': 0});

    await batch.commit();
  }

  @override
  Future<String> uploadProfilePicture({
    required File picture,
    required String userId,
  }) async {
    final path =
        '${FirebaseStoragePaths.profilePicture}/$userId${p.extension(picture.path)}';
    await _firebaseStorage.ref(path).putFile(picture);
    return path;
  }
}
