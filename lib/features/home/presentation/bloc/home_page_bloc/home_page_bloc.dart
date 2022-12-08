import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../failures/failure.dart';
import '../../../../../injection.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../domain/entitites/barbershop_overview.dart';
import '../../../domain/usecases/get_current_balance.dart';
import '../../../domain/usecases/get_nearest_barbershops.dart';
import '../../../domain/usecases/get_placemark_from_coordinates.dart';
import 'current_balance_state.dart';
import 'nearest_barbershops_state.dart';

part 'home_page_bloc.freezed.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetPlacemarkFromCoordinates _getPlacemarkFromCoordinates;
  final GetCurrentBalance _getCurrentBalance;
  final GetNearestBarbershops _getNearestBarbershops;

  StreamSubscription<Either<Failure, int>>? _currentBalanceStreamSubscription;
  StreamSubscription<Either<Failure, List<BarbershopOverview>>>?
      _nearestBarbershopsStreamSubscription;

  HomePageBloc(
    this._getPlacemarkFromCoordinates,
    this._getCurrentBalance,
    this._getNearestBarbershops,
  ) : super(HomePageState.initial()) {
    on<HomePageEvent>((event, emit) async {
      await event.when(
        initialized: () => _handleInitialized(emit),
        currentBalanceReceived: (failureOrCurrentBalance) =>
            _handleCurrentBalanceReceived(emit, failureOrCurrentBalance),
        nearestBarbershopsReceived: (failureOrBarbershops) =>
            _handleNearestBarbershopsReceived(emit, failureOrBarbershops),
      );
    });
  }

  Future<void> _handleInitialized(Emitter<HomePageState> emit) async {
    final user =
        getIt<AuthBloc>().state.whenOrNull(authenticated: (user) => user)!;
    final lastLocation = user.lastLocation!;

    final lastPlacemarker = await _getPlacemarkFromCoordinates(
      LatLng(lastLocation.latitude, lastLocation.longitude),
    );

    emit(state.copyWith(
      currentBalanceState: const CurrentBalanceState.loadInProgress(),
      nearestBarbershopsState: const NearestBarbershopsState.loadInProgess(),
    ));

    _currentBalanceStreamSubscription?.cancel();
    _currentBalanceStreamSubscription =
        _getCurrentBalance(user.id).listen((failureOrCurrentBalance) {
      add(HomePageEvent.currentBalanceReceived(failureOrCurrentBalance));
    });

    _nearestBarbershopsStreamSubscription?.cancel;
    _nearestBarbershopsStreamSubscription =
        _getNearestBarbershops(lastLocation).listen((failureOrBarbershops) {
      add(HomePageEvent.nearestBarbershopsReceived(failureOrBarbershops));
    });

    emit(state.copyWith(lastPlacemarker: optionOf(lastPlacemarker)));
  }

  Future<void> _handleCurrentBalanceReceived(
    Emitter<HomePageState> emit,
    Either<Failure, int> failureOrCurrentBalance,
  ) async {
    emit(state.copyWith(
      currentBalanceState: failureOrCurrentBalance.fold(
        (failure) => CurrentBalanceState.loadFailure(failure),
        (currentBalance) => CurrentBalanceState.loadSuccess(currentBalance),
      ),
    ));
  }

  Future<void> _handleNearestBarbershopsReceived(
    Emitter<HomePageState> emit,
    Either<Failure, List<BarbershopOverview>> failureOrBarbershops,
  ) async {
    emit(state.copyWith(
      nearestBarbershopsState: failureOrBarbershops.fold(
        (failure) => NearestBarbershopsState.loadFailure(failure),
        (barbershops) => NearestBarbershopsState.loadSuccess(barbershops),
      ),
    ));
  }

  @override
  Future<void> close() {
    _currentBalanceStreamSubscription?.cancel();
    _nearestBarbershopsStreamSubscription?.cancel();
    return super.close();
  }
}
