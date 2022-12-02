part of 'profile_setup_bloc.dart';

@freezed
class ProfileSetupFormEvent with _$ProfileSetupFormEvent {
  const factory ProfileSetupFormEvent.imagePickerOpened() = _ImagePickerOpened;
  const factory ProfileSetupFormEvent.nameChanged(String name) = _NameChanged;
  const factory ProfileSetupFormEvent.submitButtonPressed() =
      _SubmitButtonPressed;
}
