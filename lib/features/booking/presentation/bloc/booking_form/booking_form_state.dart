part of 'booking_form_bloc.dart';

@freezed
class BookingFormState with _$BookingFormState {
  const factory BookingFormState({
    required List<AppointmentService> selectedServices,
    required bool payWithBPoin,
    required int currentBPoinBalance,
    required GetterState getterState,
    required bool isSubmitting,
    required Option<Either<Failure, Unit>> failureOrSuccessOption,
    int? selectedDateTimestamp,
    List<Service>? services,
    Barbershop? barbershop,
    String? paymentUrl,
  }) = _BookingFormState;

  factory BookingFormState.initial() => BookingFormState(
        selectedServices: List.empty(),
        currentBPoinBalance: 0,
        payWithBPoin: false,
        isSubmitting: false,
        failureOrSuccessOption: none(),
        getterState: const GetterState.initial(),
      );
}
