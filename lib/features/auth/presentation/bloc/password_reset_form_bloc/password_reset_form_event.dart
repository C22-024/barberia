part of 'password_reset_form_bloc.dart';

@freezed
class PasswordResetFormEvent with _$PasswordResetFormEvent {
  const factory PasswordResetFormEvent.emailChanged(String email) =
      _EmailChanged;
  const factory PasswordResetFormEvent.submitButtonPressed() =
      _SubmitButtonPressed;
}
