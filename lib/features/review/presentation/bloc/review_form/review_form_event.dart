part of 'review_form_bloc.dart';

@freezed
class ReviewFormEvent with _$ReviewFormEvent {
  const factory ReviewFormEvent.initialized(
    String appointmentId,
    String barbershopId,
    User user,
  ) = _Initialized;
  const factory ReviewFormEvent.rateChanged(double rate) = _RateChanged;
  const factory ReviewFormEvent.contentChanged(String content) =
      _ContentChanged;
  const factory ReviewFormEvent.submitButtonPressed() = _SubmitButtonPressed;
}
