part of 'get_profile_picture_bloc.dart';

@freezed
class GetProfilePictureState with _$GetProfilePictureState {
  const factory GetProfilePictureState.initial() = _Initial;
  const factory GetProfilePictureState.inProgress() = _InProgress;
  const factory GetProfilePictureState.failure(Failure failure) = _Failure;
  const factory GetProfilePictureState.success(Uint8List? profilePictureData) = _Success;
}
