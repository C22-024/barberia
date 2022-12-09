import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/service.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    @JsonKey(ignore: true) String? id,
    required String name,
    required int durationInMinutes,
    required int price,
  }) = _ServiceModel;

  const ServiceModel._();

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  factory ServiceModel.fromFirestore(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      ServiceModel.fromJson(doc.data()!).copyWith(id: doc.id);

  Service toDomain() {
    return Service(
      id: id!,
      name: name,
      durationInMinutes: durationInMinutes,
      price: price,
    );
  }
}
