import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../constants/business_amounts.dart';
import '../../../../../failures/failure.dart';
import '../../../../../injection.dart';
import '../../../../../utils/firebase_extensions.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../../barbershop/domain/entities/barbershop.dart';
import '../../../../barbershop/domain/entities/service.dart';
import '../../../../barbershop/domain/usecases/get_barbershop.dart';
import '../../../../barbershop/domain/usecases/get_barbershop_services.dart';
import '../../../domain/entities/appointment.dart';
import '../../../domain/entities/appointment_barbershop.dart';
import '../../../domain/entities/appointment_service.dart';
import '../../../domain/entities/appointment_user.dart';
import '../../../domain/usecases/create_appointment.dart';
import '../../../domain/usecases/get_bpoin_balance.dart';
import '../../../domain/usecases/get_transaction_token.dart';
import 'getter_state.dart';

part 'booking_form_bloc.freezed.dart';
part 'booking_form_event.dart';
part 'booking_form_state.dart';

class BookingFormBloc extends Bloc<BookingFormEvent, BookingFormState> {
  final GetBarbershop _getBarbershop;
  final GetBarbershopServices _getBarbershopServices;
  final GetBpoinBalance _getBpoinBalance;
  final GetTransactionToken _getTransactionToken;
  final CreateAppointment _createAppointment;

  BookingFormBloc(
    this._getBarbershop,
    this._getBarbershopServices,
    this._getBpoinBalance,
    this._getTransactionToken,
    this._createAppointment,
  ) : super(BookingFormState.initial()) {
    on<BookingFormEvent>((event, emit) async {
      await event.when(
        initialized: (barbershopId) => _handleInitialized(emit, barbershopId),
        serviceSelected: (service) => _handleServiceSelected(emit, service),
        serviceUnselected: (service) => _handleServiceUnselected(emit, service),
        payWithBPoinChanged: (payWithBPoin) =>
            _handlePayWithBPoinChanged(emit, payWithBPoin),
        selectedDateTimestampChanged: (selectedDateTimestamp) =>
            _handleSelectedDateTimestampChanged(emit, selectedDateTimestamp),
        buttonPressed: () => _handleButtonPressed(emit),
      );
    });
  }

  Future<void> _handleInitialized(
    Emitter<BookingFormState> emit,
    String barbershopId,
  ) async {
    emit(state.copyWith(
      getterState: const GetterState.loadInProgress(),
    ));

    final user =
        getIt<AuthBloc>().state.whenOrNull(authenticated: (user) => user)!;
    final lastLocation = user.lastLocation!;

    final failureOrBarbershop =
        await _getBarbershop(barbershopId, lastLocation);

    await failureOrBarbershop.fold(
      (_) async => emit(state.copyWith(
        getterState: const GetterState.loadFailure(),
      )),
      (barbershop) async {
        final failureOrServices = await _getBarbershopServices(barbershopId);

        await failureOrServices.fold(
          (_) async => emit(state.copyWith(
            getterState: const GetterState.loadFailure(),
          )),
          (services) async {
            final failureOrBPoinBalance = await _getBpoinBalance(user.id);
            await failureOrBPoinBalance.fold(
              (_) async => emit(state.copyWith(
                getterState: const GetterState.loadFailure(),
              )),
              (bpoinBalance) async => emit(state.copyWith(
                barbershop: barbershop,
                services: services,
                currentBPoinBalance: bpoinBalance,
                getterState: const GetterState.loadSuccess(),
              )),
            );
          },
        );
      },
    );
  }

  Future<void> _handleServiceSelected(
    Emitter<BookingFormState> emit,
    Service service,
  ) async {
    final newList = List<AppointmentService>.from(state.selectedServices)
      ..add(
        AppointmentService(
            id: service.id,
            name: service.name,
            durationInMinutes: service.durationInMinutes,
            price: service.price),
      );
    emit(state.copyWith(
      selectedServices: newList,
    ));
  }

  Future<void> _handleServiceUnselected(
    Emitter<BookingFormState> emit,
    Service service,
  ) async {
    final newList = List<AppointmentService>.from(state.selectedServices)
      ..remove(
        AppointmentService(
            id: service.id,
            name: service.name,
            durationInMinutes: service.durationInMinutes,
            price: service.price),
      );
    emit(state.copyWith(
      selectedServices: newList,
    ));
  }

  Future<void> _handlePayWithBPoinChanged(
    Emitter<BookingFormState> emit,
    bool payWithBPoin,
  ) async {
    emit(state.copyWith(
      payWithBPoin: payWithBPoin,
    ));
  }

  Future<void> _handleSelectedDateTimestampChanged(
    Emitter<BookingFormState> emit,
    int selectedDateTimestamp,
  ) async {
    emit(state.copyWith(
      selectedDateTimestamp: selectedDateTimestamp,
    ));
  }

  Future<void> _handleButtonPressed(Emitter<BookingFormState> emit) async {
    emit(state.copyWith(
      isSubmitting: true,
      failureOrSuccessOption: none(),
    ));

    Either<Failure, Unit>? failureOrSuccess;
    String? paymentUrl;

    if (state.selectedServices.isNotEmpty &&
        state.selectedDateTimestamp != null) {
      final user =
          getIt<AuthBloc>().state.whenOrNull(authenticated: (user) => user)!;
      final appointmentUser =
          AppointmentUser(id: user.id, name: user.name ?? 'No Name');
      final barbershop = state.barbershop!;
      final appointmentBarbershop = AppointmentBarbershop(
        id: barbershop.id,
        name: barbershop.name,
        address: barbershop.address,
        location: barbershop.location,
      );
      final appointmentId =
          getIt<FirebaseFirestore>().appointmentColRef.doc().id;
      final total = calculateTotal(state.selectedServices);
      int payWithBPoinAmount = 0;

      if (state.payWithBPoin) {
        if (state.currentBPoinBalance >= total) {
          payWithBPoinAmount = total;
        } else {
          payWithBPoinAmount = state.currentBPoinBalance;
        }
      }

      final appointment = Appointment(
        id: appointmentId,
        user: appointmentUser,
        barbershop: appointmentBarbershop,
        services: state.selectedServices,
        timestamp: state.selectedDateTimestamp!,
        payWithBPoinAmount: payWithBPoinAmount,
      );

      if (!state.payWithBPoin ||
          state.payWithBPoin && state.currentBPoinBalance < total) {
        final failureOrToken = await _getTransactionToken(appointment);
        await failureOrToken.fold(
          (failure) async {
            emit(state.copyWith(
              isSubmitting: false,
              failureOrSuccessOption: optionOf(left(failure)),
            ));
          },
          (token) async {
            failureOrSuccess = await _createAppointment(appointment);
            paymentUrl = token.redirectUrl;
          },
        );
      } else {
        failureOrSuccess = await _createAppointment(appointment);
      }
    }

    emit(state.copyWith(
      isSubmitting: false,
      paymentUrl: paymentUrl,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  int calculateTotal(List<AppointmentService> services) {
    int total = 0;
    for (final service in services) {
      total += service.price;
    }
    return total + BusinessAmounts.appointmentFee;
  }
}
