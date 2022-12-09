import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../injection.dart';
import '../../../../utils/geofirepoint_converter.dart';
import '../../domain/entities/barbershop.dart';
import 'opening_hours_model.dart';

part 'barbershop_model.freezed.dart';
part 'barbershop_model.g.dart';

@freezed
class BarbershopModel with _$BarbershopModel {
  const factory BarbershopModel({
    @JsonKey(ignore: true) String? id,
    required String name,
    required String address,
    @GeoFirePointConverter() required GeoFirePoint location,
    required int completedAppointmentCount,
    required double rating,
    required int reviewCount,
    required bool closedManually,
    required OpeningHoursModel openingHours,
    String? photoPath,
    String? bannerPath,
  }) = _BarbershopModel;

  const BarbershopModel._();

  factory BarbershopModel.fromJson(Map<String, dynamic> json) =>
      _$BarbershopModelFromJson(json);

  factory BarbershopModel.fromFirestore(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      BarbershopModel.fromJson(doc.data()!).copyWith(id: doc.id);

  Future<Barbershop> toDomain(GeoFirePoint userLocation) async {
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

    return Barbershop(
      id: id!,
      name: name,
      address: address,
      location: location,
      completedAppointmentCount: completedAppointmentCount,
      rating: rating,
      reviewCount: reviewCount,
      closedManually: closedManually,
      openingHours: openingHours.toDomain(),
      distance: distance,
      photoUrl: photoUrl,
      bannerUrl: bannerUrl,
    );
  }
}
