import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/failure.dart';
import '../../../domain/entities/appointment.dart';
import '../../../domain/usecases/get_appointments.dart';

part 'appoinment_getter_bloc.freezed.dart';
part 'appoinment_getter_event.dart';
part 'appoinment_getter_state.dart';

class AppoinmentGetterBloc
    extends Bloc<AppoinmentGetterEvent, AppoinmentGetterState> {
  final GetAppointments getAppointments;

  StreamSubscription<Either<Failure, List<Appointment>>>?
      _appointmentStreamSubscription;

  AppoinmentGetterBloc(this.getAppointments)
      : super(const AppoinmentGetterState.initial()) {
    on<AppoinmentGetterEvent>((event, emit) async {
      await event.when(
        getAllStarted: () => _handleGetAllStarted(emit),
        appointmentsReceived: (failureOrAppointments) =>
            _handleAppoinmentsReceived(emit, failureOrAppointments),
      );
    });
  }

  Future<void> _handleGetAllStarted(Emitter<AppoinmentGetterState> emit) async {
    emit(const AppoinmentGetterState.inProgress());
    _appointmentStreamSubscription?.cancel();
    _appointmentStreamSubscription = getAppointments.execute().listen((event) {
      add(AppoinmentGetterEvent.appointmentsReceived(event));
    });
  }

  Future<void> _handleAppoinmentsReceived(Emitter<AppoinmentGetterState> emit,
      Either<Failure, List<Appointment>> failureOrAppointments) async {
    emit(failureOrAppointments.fold(
      (failure) => AppoinmentGetterState.failure(failure),
      (appointments) => AppoinmentGetterState.success(appointments),
    ));
  }
}
