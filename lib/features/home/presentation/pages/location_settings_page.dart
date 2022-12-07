import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../common_widgets/spacing.dart';
import '../../../../constants/failure_messages.dart';
import '../../../../constants/geolocator_failure_messages.dart';
import '../../../../injection.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../bloc/location_settings_bloc/location_settings_bloc.dart';

class LocationSettingsPage extends StatefulWidget {
  const LocationSettingsPage({super.key});

  @override
  State<LocationSettingsPage> createState() => _LocationSettingsPageState();
}

class _LocationSettingsPageState extends State<LocationSettingsPage> {
  final mapController = MapController();

  Widget _buildAppBarLeading(BuildContext context, AuthState state) {
    return Center(
      child: BIconButton.circle(
        onPressed: () {
          final lastLocation =
              state.whenOrNull(authenticated: (user) => user)?.lastLocation;
          if (lastLocation == null) {
            FlushbarHelper.createInformation(
              message: 'Pilih dan simpan dulu lokasimu, yaa.',
            ).show(context);
          } else {
            context.goNamed('home');
          }
        },
        variant: BButtonVariant.bare,
        size: BWidgetSize.medium,
        child: const Icon(Icons.close),
      ),
    );
  }

  void _listenToCanAccessLocationServiceState(
    BuildContext context,
    LocationSettingsState state,
  ) {
    state.canAccessLocationService.fold(
      () => null,
      (canAccessLocation) => canAccessLocation.fold(
        (failure) {
          FlushbarHelper.createError(
            message: failure.when(
              serviceDisabled: () => GeolocatorFailureMessages.serviceDisabled,
              permissionDenied: () =>
                  GeolocatorFailureMessages.permissionDisabled,
            ),
          ).show(context);
        },
        (_) => null,
      ),
    );
  }

  void _listenTofailureOrSuccessOptionState(
    BuildContext context,
    LocationSettingsState state,
  ) {
    state.failureOrSuccessOption.fold(
      () => null,
      (failureOrSuccess) => failureOrSuccess.fold(
        (failure) => FlushbarHelper.createError(
          message: failure.when(
            timeout: () => FailureMessages.timeout,
            unexpected: (_, __, ___) => FailureMessages.unexpected,
          ),
        ).show(context),
        (_) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            FlushbarHelper.createSuccess(
              message: 'Yeay, lokasimu berhasil disimpan!',
            ).show(context);
          });
          context.goNamed('home');
          // TODO: refresh home page
        },
      ),
    );
  }

  LatLng? _getLastLocation() {
    final lastLocation = getIt<AuthBloc>()
        .state
        .whenOrNull(authenticated: (user) => user)
        ?.lastLocation;

    if (lastLocation != null) {
      return LatLng(lastLocation.latitude, lastLocation.longitude);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocationSettingsBloc>()
        ..add(LocationSettingsEvent.initialized(optionOf(_getLastLocation()))),
      child: MultiBlocListener(
        listeners: [
          BlocListener<LocationSettingsBloc, LocationSettingsState>(
            listenWhen: (p, c) =>
                p.canAccessLocationService != c.canAccessLocationService,
            listener: _listenToCanAccessLocationServiceState,
          ),
          BlocListener<LocationSettingsBloc, LocationSettingsState>(
            listenWhen: (p, c) =>
                p.failureOrSuccessOption != c.failureOrSuccessOption,
            listener: _listenTofailureOrSuccessOptionState,
          ),
        ],
        child: Scaffold(
          appBar: BAppBar(
            leading: BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) =>
                  current
                      .whenOrNull(authenticated: (user) => user)
                      ?.lastLocation !=
                  null,
              builder: _buildAppBarLeading,
            ),
            automaticallyImplyLeading: false,
            title: BText.titleSmall('Lokasimu'),
            actions: [_GPSButton(mapController)],
          ),
          body: _Body(mapController),
          bottomSheet: const _BottomSheet(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}

class _Body extends StatelessWidget {
  const _Body(this.mapController);

  final MapController mapController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationSettingsBloc, LocationSettingsState>(
      buildWhen: (p, c) =>
          p.canAccessLocationService != c.canAccessLocationService,
      builder: (context, state) {
        return FlutterMap(
          mapController: mapController,
          options: MapOptions(
            onTap: (_, point) => context
                .read<LocationSettingsBloc>()
                .add(LocationSettingsEvent.currentLocationChanged(point)),
            slideOnBoundaries: true,
            center: context
                    .read<LocationSettingsBloc>()
                    .state
                    .currentLocation
                    .toNullable() ??
                LatLng(-6.20000124, 106.81665659), // LatLng of Jakarta
            zoom: 9,
            maxZoom: 22,
          ),
          nonRotatedChildren: const [_AttributionWidget()],
          children: [
            TileLayer(
              urlTemplate:
                  'https://{s}.tile.thunderforest.com/{style}/{z}/{x}/{y}{r}.png?apikey={apiKey}',
              subdomains: const ['a', 'b', 'c'],
              additionalOptions: {
                'style': 'atlas',
                'apiKey': const bool.hasEnvironment('TF_MAP_KEY')
                    ? const String.fromEnvironment('TF_MAP_KEY')
                    : throw AssertionError('TF_MAP_KEY is not set.'),
              },
              maxZoom: 22,
              userAgentPackageName: 'id.barberia',
            ),
            const _LocationMarkerLayer(),
            ...state.canAccessLocationService.fold(
              () => [],
              (status) => status.fold(
                (_) => [],
                (_) => [const _GPSLocationLayer()],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: BColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BText.titleSmall('Lokasi yang kamu pilih:'),
            BlocBuilder<LocationSettingsBloc, LocationSettingsState>(
              buildWhen: (p, c) => p.currentPlacemark != c.currentPlacemark,
              builder: (context, state) {
                final currentPlacemark = state.currentPlacemark.fold(
                  () => 'Tap pada peta untuk memilih lokasi.',
                  (currentPlacemark) => currentPlacemark,
                );
                return BText.body(
                  currentPlacemark,
                  maxLines: 3,
                );
              },
            ),
            verticalSpace16,
            BlocBuilder<LocationSettingsBloc, LocationSettingsState>(
              buildWhen: (p, c) =>
                  p.saveButtonEnabled != c.saveButtonEnabled ||
                  p.isSubmitting != c.isSubmitting,
              builder: (context, state) {
                return BButton(
                  label: 'Simpan',
                  busy: state.isSubmitting,
                  enabled: state.saveButtonEnabled,
                  onPressed: () => context
                      .read<LocationSettingsBloc>()
                      .add(const LocationSettingsEvent.saveButtonPressed()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AttributionWidget extends StatelessWidget {
  const _AttributionWidget();

  @override
  Widget build(BuildContext context) {
    return AttributionWidget(
      attributionBuilder: (context) {
        return ColoredBox(
          color: BColors.neutral0t128,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: BText(
              'flutter_map | © Thunderforest | © OpenStreetMap contributors',
              style: captionStyle.copyWith(
                color: BColors.neutral700,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GPSButton extends StatelessWidget {
  const _GPSButton(this.mapController);

  final MapController mapController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationSettingsBloc, LocationSettingsState>(
      listenWhen: (p, c) => p.isLoadingGPSLocation != c.isLoadingGPSLocation,
      listener: (context, state) {
        if (!state.isLoadingGPSLocation) {
          state.currentGPSLocation.fold(
            () => null,
            (position) => mapController.move(
              LatLng(position.latitude, position.longitude),
              15,
            ),
          );
        }
      },
      buildWhen: (p, c) => p.isLoadingGPSLocation != c.isLoadingGPSLocation,
      builder: (context, state) {
        return Center(
          child: BIconButton.circle(
            onPressed: () {
              context
                  .read<LocationSettingsBloc>()
                  .add(const LocationSettingsEvent.gpsButtonPressed());
            },
            busy: state.isLoadingGPSLocation,
            variant: BButtonVariant.bare,
            child: const Icon(Icons.location_searching),
          ),
        );
      },
    );
  }
}

class _LocationMarkerLayer extends StatelessWidget {
  const _LocationMarkerLayer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationSettingsBloc, LocationSettingsState>(
      buildWhen: (previous, current) =>
          previous.currentLocation != current.currentLocation,
      builder: (context, state) {
        return MarkerLayer(
          rotate: true,
          markers: [
            if (state.currentLocation.isSome())
              Marker(
                point: state.currentLocation.toNullable()!,
                width: 48,
                height: 48,
                builder: (context) => Stack(
                  clipBehavior: Clip.none,
                  children: const [
                    Positioned(
                      top: -24,
                      child: Icon(
                        Icons.location_pin,
                        color: BColors.neutral1000,
                        size: 48,
                      ),
                    )
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _GPSLocationLayer extends StatelessWidget {
  const _GPSLocationLayer();

  @override
  Widget build(BuildContext context) {
    return CurrentLocationLayer(
      positionStream:
          const LocationMarkerDataStreamFactory().geolocatorPositionStream(
        stream: context.read<LocationSettingsBloc>().getGPSLocation(),
      ),
      centerOnLocationUpdate: CenterOnLocationUpdate.once,
    );
  }
}
