part of 'profile_setup_bloc.dart';

@freezed
class ProfileSetupFormState with _$ProfileSetupFormState {
  const factory ProfileSetupFormState({
    required Option<File> profilePictureOption,
    required Either<ValueFailure<String>, String> name,
    required bool isSubmitting,
    required bool errorMessagesShown,
    required Option<Either<Failure, Unit>> failureOrSuccessOption,
  }) = _ProfileSetupFormState;

  factory ProfileSetupFormState.initial() => ProfileSetupFormState(
        profilePictureOption: none(),
        name: validateName(''),
        isSubmitting: false,
        errorMessagesShown: false,
        failureOrSuccessOption: none(),
      );
}
