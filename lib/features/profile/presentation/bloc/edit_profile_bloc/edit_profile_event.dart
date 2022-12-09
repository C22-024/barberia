part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.imagePickerOpened() = _ImagePickerOpened;
  const factory EditProfileEvent.nameChanged(String name) = _NameChanged;
  const factory EditProfileEvent.submitButtonPressed() = _SubmitButtonPressed;
}
