import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/failure.dart';
import '../../../domain/usecase/get_profile_picture.dart';

part 'get_profile_picture_bloc.freezed.dart';
part 'get_profile_picture_event.dart';
part 'get_profile_picture_state.dart';

class GetProfilePictureBloc extends Bloc<GetProfilePictureEvent, GetProfilePictureState> {
  final GetProfilePicture getProfilePicture;

  GetProfilePictureBloc(this.getProfilePicture) : super(const GetProfilePictureState.initial()) {
    on<GetProfilePictureEvent>((event, emit) async {
      await event.when(
        photoProfileRequested: (photoUrl) => _handlePhotoProfileRequested(emit, photoUrl),
      );
    });
  }

  Future<void> _handlePhotoProfileRequested(
    Emitter<GetProfilePictureState> emit,
    String? photoUrl,
  ) async {
    emit(const GetProfilePictureState.inProgress());
    if (photoUrl == null) {
      emit(const GetProfilePictureState.success(null));
    } else {
      final result = await getProfilePicture(photoUrl);

      result.fold(
        (failure) => emit(GetProfilePictureState.failure(failure)),
        (profilePictureData) => emit(GetProfilePictureState.success(profilePictureData)),
      );
    }
  }
}
