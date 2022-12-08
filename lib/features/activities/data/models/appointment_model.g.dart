// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentModel _$$_AppointmentModelFromJson(Map<String, dynamic> json) =>
    _$_AppointmentModel(
      status: json['status'] as Map<String, dynamic>,
      user: json['user'] as Map<String, dynamic>,
      barbershop: json['barbershop'] as Map<String, dynamic>,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      userDefinedExpiry: json['userDefinedExpiry'] as int?,
      timeStamp: json['timeStamp'] as int?,
      paymentDetails: json['paymentDetails'] as Map<String, dynamic>?,
      review: json['review'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_AppointmentModelToJson(_$_AppointmentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user,
      'barbershop': instance.barbershop,
      'services': instance.services,
      'userDefinedExpiry': instance.userDefinedExpiry,
      'timeStamp': instance.timeStamp,
      'paymentDetails': instance.paymentDetails,
      'review': instance.review,
    };
