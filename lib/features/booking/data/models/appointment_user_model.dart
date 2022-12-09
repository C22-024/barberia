import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/appointment_user.dart';

part 'appointment_user_model.freezed.dart';
part 'appointment_user_model.g.dart';

@freezed
class AppointmentUserModel with _$AppointmentUserModel {
  const factory AppointmentUserModel({
    required String id,
    required String name,
  }) = _AppointmentUserModel;

  factory AppointmentUserModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentUserModelFromJson(json);

  factory AppointmentUserModel.fromDomain(AppointmentUser user) {
    return AppointmentUserModel(
      id: user.id,
      name: user.name,
    );
  }
}
