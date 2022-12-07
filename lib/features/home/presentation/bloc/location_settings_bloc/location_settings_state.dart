part of 'location_settings_bloc.dart';

@freezed
class LocationSettingsState with _$LocationSettingsState {
  const factory LocationSettingsState({
    required Option<String> currentPlacemark,
    required Option<LatLng> currentLocation,
    required Option<Position> currentGPSLocation,
    required bool isLoadingGPSLocation,
    required bool isSubmitting,
    required bool saveButtonEnabled,
    required Option<Either<GeolocatorFailure, Unit>> canAccessLocationService,
    required Option<Either<Failure, Unit>> failureOrSuccessOption,
  }) = _LocationSettingsState;

  factory LocationSettingsState.initial() => LocationSettingsState(
        currentPlacemark: none(),
        currentLocation: none(),
        currentGPSLocation: none(),
        isLoadingGPSLocation: false,
        isSubmitting: false,
        saveButtonEnabled: false,
        canAccessLocationService: none(),
        failureOrSuccessOption: none(),
      );
}
