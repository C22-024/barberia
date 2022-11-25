part of 'signup_form_bloc.dart';

@freezed
class SignupFormState with _$SignupFormState {
  const factory SignupFormState({
    required Either<String, String> email,
    required Either<String, String> password,
    required bool isSubmitting,
    required bool errorMessagesShown,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignupFormState;

  factory SignupFormState.initial() => SignupFormState(
        email: left(''),
        password: left(''),
        isSubmitting: false,
        errorMessagesShown: false,
        authFailureOrSuccessOption: none(),
      );
}
