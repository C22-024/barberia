import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../domain/entities/user.dart';

extension FirebaseUserX on firebase_auth.User {
  User toDomainUser() {
    return User(
      id: 'user_$uid',
      email: email!,
    );
  }
}
