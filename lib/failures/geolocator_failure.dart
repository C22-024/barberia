import 'package:freezed_annotation/freezed_annotation.dart';

part 'geolocator_failure.freezed.dart';

@freezed
class GeolocatorFailure with _$GeolocatorFailure {
  const factory GeolocatorFailure.serviceDisabled() = _ServiceDisabled;
  const factory GeolocatorFailure.permissionDenied() = _PermissionDenied;
}
