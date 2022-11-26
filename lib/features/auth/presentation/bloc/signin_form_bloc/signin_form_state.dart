part of 'signin_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required Either<ValueFailure<String>, String> email,
    required Either<ValueFailure<String>, String> password,
    required bool isSubmitting,
    required bool errorMessagesShown,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SigninFormState;

  factory SignInFormState.initial() => SignInFormState(
        email: validateEmailAddress(''),
        password: validatePassword('', 8),
        isSubmitting: false,
        errorMessagesShown: false,
        authFailureOrSuccessOption: none(),
      );
}
