part of 'signup_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.emailChanged(String email) = _EmailChanged;
  const factory SignUpFormEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory SignUpFormEvent.signUpButtonPressed() = _SignUpButtonPressed;
}
