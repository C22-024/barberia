import 'package:barberia/features/home/data/models/barbershop_overview_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../utils/firebase_extensions.dart';

abstract class HomeRemoteDataSource {
  Future<void> updateLastLocation({
    required String userId,
    required GeoFirePoint currentLocation,
  });
  Stream<int> getCurrentBalance(String userId);
  Stream<List<BarbershopOverviewModel>> getNearestBarbershops(
      GeoFirePoint userLocation);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl(this._firestore, this._geo);

  final FirebaseFirestore _firestore;
  final GeoFlutterFire _geo;

  @override
  Future<void> updateLastLocation({
    required String userId,
    required GeoFirePoint currentLocation,
  }) async {
    await _firestore
        .userDocRef(userId)
        .update({'lastLocation': currentLocation.data});
  }

  @override
  Stream<int> getCurrentBalance(String userId) async* {
    yield* _firestore
        .pointBalanceDocRef(userId)
        .snapshots()
        .map((doc) => (doc.data() as Map<String, dynamic>?)!['currentBalance']);
  }

  @override
  Stream<List<BarbershopOverviewModel>> getNearestBarbershops(
    GeoFirePoint userLocation,
  ) async* {
    final colRef = _firestore.barbershopColRef;
    yield* _geo
        .collection(collectionRef: colRef)
        .within(center: userLocation, radius: 20, field: 'location')
        .map((docs) => docs
            .map((doc) => BarbershopOverviewModel.fromFirestore(
                  doc as DocumentSnapshot<Map<String, dynamic>>,
                ))
            .toList());
  }
}
