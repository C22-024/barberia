import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(ignore: true) String? id,
    required String email,
    String? name,
    String? photoUrl,
    @GeoFirePointConverter() GeoFirePoint? lastLocation,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromDomain(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      photoUrl: user.photoUrl,
      lastLocation: user.lastLocation,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) =>
      UserModel.fromJson(doc.data()!).copyWith(id: doc.id);

  User toDomain() {
    return User(
      id: id!,
      email: email,
      name: name,
      photoUrl: photoUrl,
      lastLocation: lastLocation,
    );
  }
}

class GeoFirePointConverter
    implements JsonConverter<GeoFirePoint, Map<String, dynamic>> {
  const GeoFirePointConverter();

  @override
  GeoFirePoint fromJson(Map<String, dynamic> json) {
    final geopoint = json['geopoint'] as GeoPoint;
    return GeoFlutterFire().point(
      latitude: geopoint.latitude,
      longitude: geopoint.longitude,
    );
  }

  @override
  Map<String, dynamic> toJson(GeoFirePoint object) {
    return object.data;
  }
}
