import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../utils/firebase_extensions.dart';
import '../../../auth/data/models/user_model.dart';

abstract class ProfileUserRemoteDataSource {
  Future<Uint8List?> getProfilePicture(String photoUrl);
  Future<void> updateUserProfile(UserModel userModel);
}

class ProfileUserRemoteDataSourceImpl implements ProfileUserRemoteDataSource {
  const ProfileUserRemoteDataSourceImpl(this._firebaseStorage, this._firestore);

  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  @override
  Future<Uint8List?> getProfilePicture(String photoUrl) {
    return _firebaseStorage.ref(photoUrl).getData();
  }

  @override
  Future<void> updateUserProfile(UserModel userModel) async {
    await _firestore.userDocRef(userModel.id!).update(userModel.toJson());
  }
}
