import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import 'package:barberia/features/auth/data/models/user_model.dart';

void main() {
  const geopoint = GeoPoint(19, -155);
  final json = {
    'geohash': '8e3u0fu7n',
    'geopoint': geopoint,
  };
  final geofirepoint = GeoFlutterFire().point(latitude: 19, longitude: -155);

  group('GeoFirePointConverter', () {
    test('should return a valid model from JSON', () {
      final result = const GeoFirePointConverter().fromJson(json);

      expect(result.hash, geofirepoint.hash);
    });

    test('should return GeoFirePoint', () {
      final result = const GeoFirePointConverter().toJson(geofirepoint);

      expect(result, json);
    });
  });
}
