part of 'signup_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required Either<ValueFailure<String>, String> email,
    required Either<ValueFailure<String>, String> password,
    required String confirmationPassword,
    required bool isConfirmationPasswordValid,
    required bool isSubmitting,
    required bool errorMessagesShown,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignupFormState;

  factory SignUpFormState.initial() => SignUpFormState(
        email: validateEmailAddress(''),
        password: validatePassword('', 8),
        confirmationPassword: '',
        isConfirmationPasswordValid: true,
        isSubmitting: false,
        errorMessagesShown: false,
        authFailureOrSuccessOption: none(),
      );
}
