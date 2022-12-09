part of 'get_profile_picture_bloc.dart';

@freezed
class GetProfilePictureEvent with _$GetProfilePictureEvent {
  const factory GetProfilePictureEvent.photoProfileRequested(String? photoUrl) = _PhotoProfileRequested;
}
