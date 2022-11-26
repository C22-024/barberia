part of 'signin_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String email) = _EmailChanged;
  const factory SignInFormEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory SignInFormEvent.signInButtonPressed() = _SignInButtonPressed;
}
