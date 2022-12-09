part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required Option<File> profilePictureOption,
    required Uint8List? profilePictureRemote,
    required Either<ValueFailure<String>, String> name,
    required bool isSubmitting,
    required bool errorMessagesShown,
    required Option<Either<Failure, Unit>> failureOrSuccessOption,
  }) = _EditProfileState;

  factory EditProfileState.initial() => EditProfileState(
        profilePictureOption: none(),
        profilePictureRemote: null,
        name: validateName(''),
        isSubmitting: false,
        errorMessagesShown: false,
        failureOrSuccessOption: none(),
      );
}
