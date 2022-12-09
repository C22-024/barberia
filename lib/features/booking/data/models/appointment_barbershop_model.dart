import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../utils/geofirepoint_converter.dart';
import '../../domain/entities/appointment_barbershop.dart';

part 'appointment_barbershop_model.freezed.dart';
part 'appointment_barbershop_model.g.dart';

@freezed
class AppointmentBarbershopModel with _$AppointmentBarbershopModel {
  const factory AppointmentBarbershopModel({
    required String id,
    required String name,
    required String address,
    @GeoFirePointConverter() required GeoFirePoint location,
  }) = _AppointmentBarbershopModel;

  factory AppointmentBarbershopModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentBarbershopModelFromJson(json);

  factory AppointmentBarbershopModel.fromDomain(
      AppointmentBarbershop barbershop) {
    return AppointmentBarbershopModel(
      id: barbershop.id,
      name: barbershop.name,
      address: barbershop.address,
      location: barbershop.location,
    );
  }
}
