import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

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
