part of 'signin_form_bloc.dart';

@freezed
class SigninFormState with _$SigninFormState {
  const factory SigninFormState({
    required Either<String, String> email,
    required Either<String, String> password,
    required bool isSubmitting,
    required bool errorMessagesShown,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SigninFormState;

  factory SigninFormState.initial() => SigninFormState(
        email: left(''),
        password: left(''),
        isSubmitting: false,
        errorMessagesShown: false,
        authFailureOrSuccessOption: none(),
      );
}
