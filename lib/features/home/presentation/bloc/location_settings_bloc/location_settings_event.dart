part of 'location_settings_bloc.dart';

@freezed
class LocationSettingsEvent with _$LocationSettingsEvent {
  const factory LocationSettingsEvent.initialized(
      Option<LatLng> currentLocationOption) = _Initialized;
  const factory LocationSettingsEvent.currentLocationChanged(
      LatLng currentLocation) = _CurrentLocationChanged;
  const factory LocationSettingsEvent.currentGPSLocationChanged(
      Position position) = _CurrentGPSLocationChanged;
  const factory LocationSettingsEvent.gpsButtonPressed() = _GPSButtonPressed;
  const factory LocationSettingsEvent.saveButtonPressed() = _SaveButtonPressed;
}
