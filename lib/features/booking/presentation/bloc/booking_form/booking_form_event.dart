part of 'booking_form_bloc.dart';

@freezed
class BookingFormEvent with _$BookingFormEvent {
  const factory BookingFormEvent.initialized(String barbershopId) =
      _Initialized;
  const factory BookingFormEvent.serviceSelected(Service service) =
      _ServiceSelected;
  const factory BookingFormEvent.serviceUnselected(Service service) =
      _ServiceUnselected;
  const factory BookingFormEvent.payWithBPoinChanged(bool payWithBPoin) =
      _PayWithBPoinChanged;
  const factory BookingFormEvent.selectedDateTimestampChanged(
      int selectedDateTimestamp) = _SelectedDateTimestampChanged;
  const factory BookingFormEvent.buttonPressed() = _ButtonPressed;
}
