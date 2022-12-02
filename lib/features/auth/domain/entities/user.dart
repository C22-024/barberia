import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    String? name,
    String? photoUrl,
    GeoFirePoint? lastLocation,
  }) = _User;

  const User._();

  // Compare [GeoFirePoint] equality by its hash because
  // [GeoFirePoint] doesn't override Dart default equality.
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.lastLocation, lastLocation) ||
                other.lastLocation?.hash == lastLocation?.hash));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, photoUrl, lastLocation?.hash);
}
