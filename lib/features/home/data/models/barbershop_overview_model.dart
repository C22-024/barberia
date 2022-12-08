import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../injection.dart';
import '../../../auth/data/models/user_model.dart';
import '../../domain/entitites/barbershop_overview.dart';

part 'barbershop_overview_model.freezed.dart';
part 'barbershop_overview_model.g.dart';

@freezed
class BarbershopOverviewModel with _$BarbershopOverviewModel {
  const factory BarbershopOverviewModel({
    @JsonKey(ignore: true) String? id,
    required String name,
    required double rating,
    @GeoFirePointConverter() required GeoFirePoint location,
    String? photoPath,
    String? bannerPath,
  }) = _BarbershopOverviewModel;

  const BarbershopOverviewModel._();

  factory BarbershopOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$BarbershopOverviewModelFromJson(json);

  factory BarbershopOverviewModel.fromFirestore(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      BarbershopOverviewModel.fromJson(doc.data()!).copyWith(id: doc.id);

  Future<BarbershopOverview> toDomain(GeoFirePoint userLocation) async {
    String? photoUrl;
    String? bannerUrl;

    if (photoPath != null) {
      photoUrl = await getIt<FirebaseStorage>().ref(photoPath).getDownloadURL();
    }

    if (bannerPath != null) {
      bannerUrl =
          await getIt<FirebaseStorage>().ref(bannerPath).getDownloadURL();
    }

    final distance = userLocation.distance(
      lat: location.latitude,
      lng: location.longitude,
    );

    return BarbershopOverview(
      id: id!,
      name: name,
      rating: rating,
      distance: distance,
      photoUrl: photoUrl,
      bannerUrl: bannerUrl,
    );
  }
}
