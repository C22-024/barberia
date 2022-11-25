part of 'signin_form_bloc.dart';

@freezed
class SigninFormEvent with _$SigninFormEvent {
  const factory SigninFormEvent.emailChanged(String email) = _EmailChanged;
  const factory SigninFormEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory SigninFormEvent.signInButtonPressed() = _SignInButtonPressed;
}
