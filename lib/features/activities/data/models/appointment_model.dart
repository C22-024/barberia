import 'package:barberia/features/activities/domain/entities/appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@freezed
class AppointmentModel with _$AppointmentModel {
  const factory AppointmentModel({
    @JsonKey(ignore: true) String? id,
    required Map status,
    required Map user,
    required Map barbershop,
    List<Map>? services,
    int? userDefinedExpiry,
    int? timeStamp,
    Map? paymentDetails,
    Map? review,
  }) = _AppointmentModel;

  const AppointmentModel._();

  factory AppointmentModel.fromDomain(Appointment appointment) {
    return AppointmentModel(
      status: appointment.status,
      user: appointment.user,
      barbershop: appointment.barbershop,
      services: appointment.services,
      userDefinedExpiry: appointment.userDefinedExpiry,
      timeStamp: appointment.timeStamp,
      paymentDetails: appointment.paymentDetails,
      review: appointment.review,
    );
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  factory AppointmentModel.fromFirestore(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      AppointmentModel.fromJson(doc.data()!).copyWith(id: doc.id);

  Appointment toDomain() {
    return Appointment(
      id: id!,
      status: status,
      user: user,
      barbershop: barbershop,
      services: services,
      userDefinedExpiry: userDefinedExpiry,
      timeStamp: timeStamp,
      paymentDetails: paymentDetails,
      review: review,
    );
  }
}
