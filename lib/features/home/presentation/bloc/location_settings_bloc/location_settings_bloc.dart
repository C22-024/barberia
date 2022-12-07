import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../failures/failure.dart';
import '../../../../../failures/geolocator_failure.dart';
import '../../../../../injection.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../domain/usecases/get_gps_location.dart';
import '../../../domain/usecases/get_placemark_from_coordinates.dart';
import '../../../domain/usecases/request_location_permission.dart';
import '../../../domain/usecases/update_last_location.dart';

part 'location_settings_bloc.freezed.dart';
part 'location_settings_event.dart';
part 'location_settings_state.dart';

class LocationSettingsBloc
    extends Bloc<LocationSettingsEvent, LocationSettingsState> {
  final UpdateLastLocation _updateLastLocation;
  final RequestLocationPermission _requestLocationPermission;
  final GetGPSLocation getGPSLocation;
  final GetPlacemarkFromCoordinates _getPlacemarkFromCoordinates;
  StreamSubscription<Position>? _gpsPositionStream;

  LocationSettingsBloc(
    this._updateLastLocation,
    this._requestLocationPermission,
    this.getGPSLocation,
    this._getPlacemarkFromCoordinates,
  ) : super(LocationSettingsState.initial()) {
    on<LocationSettingsEvent>((event, emit) async {
      await event.when(
        initialized: (currentLocationOption) =>
            _handleInitialized(emit, currentLocationOption),
        currentLocationChanged: (currentLocation) =>
            _handleCurrentLocationChanged(emit, currentLocation),
        gpsButtonPressed: () => _handleGPSButtonPressed(emit),
        saveButtonPressed: () => _handleSaveButtonPressed(emit),
        currentGPSLocationChanged: (position) =>
            _handleCurrentGPSLocationChanged(emit, position),
      );
    });
  }

  Future<void> _handleInitialized(
    Emitter<LocationSettingsState> emit,
    Option<LatLng> currentLocationOption,
  ) async {
    final permission = await _requestLocationPermission();

    permission.fold(
      (_) => null,
      (_) => _gpsPositionStream ??= getGPSLocation().listen((position) {
        add(LocationSettingsEvent.currentGPSLocationChanged(position));
      }),
    );

    // get placemark
    String? currentPlacemark;
    await currentLocationOption.fold(
      () => null,
      (currentLocation) async {
        currentPlacemark = await _getPlacemarkFromCoordinates(currentLocation);
      },
    );

    emit(currentLocationOption.fold(
      () => state.copyWith(
        canAccessLocationService: optionOf(permission),
      ),
      (currentLocation) => state.copyWith(
        currentPlacemark: optionOf(currentPlacemark),
        currentLocation: optionOf(currentLocation),
        canAccessLocationService: optionOf(permission),
      ),
    ));
  }

  Future<void> _handleCurrentLocationChanged(
    Emitter<LocationSettingsState> emit,
    LatLng currentLocation,
  ) async {
    final currentPlacemark =
        await _getPlacemarkFromCoordinates(currentLocation);
    emit(state.copyWith(
      saveButtonEnabled: true,
      currentPlacemark: optionOf(currentPlacemark),
      currentLocation: optionOf(currentLocation),
    ));
  }

  Future<void> _handleCurrentGPSLocationChanged(
    Emitter<LocationSettingsState> emit,
    Position position,
  ) async {
    emit(state.copyWith(
      isLoadingGPSLocation: false,
      currentGPSLocation: optionOf(position),
    ));
  }

  Future<void> _handleGPSButtonPressed(
    Emitter<LocationSettingsState> emit,
  ) async {
    emit(state.copyWith(
      isLoadingGPSLocation: true,
    ));
    final permission = await _requestLocationPermission();
    permission.fold(
      (_) => emit(state.copyWith(
        isLoadingGPSLocation: false,
        canAccessLocationService: optionOf(permission),
      )),
      (_) {
        _gpsPositionStream?.cancel();
        _gpsPositionStream = getGPSLocation().listen((position) {
          add(LocationSettingsEvent.currentGPSLocationChanged(position));
        });
        emit(state.copyWith(
          canAccessLocationService: optionOf(permission),
        ));
      },
    );
  }

  Future<void> _handleSaveButtonPressed(
    Emitter<LocationSettingsState> emit,
  ) async {
    final hasCurrentLocation = state.currentLocation.isSome();
    Either<Failure, Unit>? failureOrSuccess;

    if (hasCurrentLocation) {
      emit(state.copyWith(
        isSubmitting: true,
        failureOrSuccessOption: none(),
      ));

      final currentLocation = state.currentLocation.toNullable()!;
      final userId =
          getIt<AuthBloc>().state.whenOrNull(authenticated: (user) => user)!.id;

      failureOrSuccess = await _updateLastLocation(
        userId: userId,
        currentLocation: currentLocation,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  @override
  Future<void> close() {
    _gpsPositionStream?.cancel();
    return super.close();
  }
}
