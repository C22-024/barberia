part of 'signup_form_bloc.dart';

@freezed
class SignupFormEvent with _$SignupFormEvent {
  const factory SignupFormEvent.emailChanged(String email) = _EmailChanged;
  const factory SignupFormEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory SignupFormEvent.signUpButtonPressed() = _SignUpButtonPressed;
}
