part of 'password_reset_form_bloc.dart';

@freezed
class PasswordResetFormState with _$PasswordResetFormState {
  const factory PasswordResetFormState({
    required Either<ValueFailure<String>, String> email,
    required bool isSubmitting,
    required bool errorMessagesShown,
    required Option<Either<AuthFailure, Unit>> sendEmailFailureOrSuccessOption,
  }) = _PasswordResetFormState;

  factory PasswordResetFormState.initial() => PasswordResetFormState(
        email: validateEmailAddress(''),
        isSubmitting: false,
        errorMessagesShown: false,
        sendEmailFailureOrSuccessOption: none(),
      );
}
