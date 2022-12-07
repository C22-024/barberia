import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../utils/firebase_extensions.dart';

abstract class HomeRemoteDataSource {
  Future<void> updateLastLocation({
    required String userId,
    required GeoFirePoint currentLocation,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<void> updateLastLocation({
    required String userId,
    required GeoFirePoint currentLocation,
  }) async {
    await _firestore
        .userDocRef(userId)
        .update({'lastLocation': currentLocation.data});
  }
}
