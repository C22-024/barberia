import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/failure.dart';
import '../../../../../failures/value_failure.dart';
import '../../../../../injection.dart';
import '../../../../../utils/value_validators.dart';
import '../../../../auth/domain/entities/user.dart';
import '../../../../auth/domain/usecase/pick_image.dart';
import '../../../../auth/domain/usecase/upload_profile_picture.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../domain/usecase/update_user_profile.dart';

part 'edit_profile_bloc.freezed.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final PickImage _pickImage;
  final UpdateUserProfile _updateUserProfile;
  final UploadProfilePicture _uploadProfilePicture;

  EditProfileBloc(
    this._pickImage,
    this._updateUserProfile,
    this._uploadProfilePicture,
  ) : super(EditProfileState.initial()) {
    on<EditProfileEvent>((event, emit) async {
      await event.when(
        imagePickerOpened: () => _handleImagePickerOpened(emit),
        nameChanged: (name) => _handleNameChanged(emit, name),
        submitButtonPressed: () => _handleSubmitButtonPressed(emit),
      );
    });
  }

  Future<void> _handleImagePickerOpened(
    Emitter<EditProfileState> emit,
  ) async {
    final picture = await _pickImage();

    final profilePictureOption = state.profilePictureOption.fold(
      () => optionOf(picture),
      (oldPicture) => optionOf(picture ?? oldPicture),
    );

    emit(state.copyWith(
      profilePictureOption: profilePictureOption,
    ));
  }

  Future<void> _handleNameChanged(
    Emitter<EditProfileState> emit,
    String name,
  ) async {
    emit(state.copyWith(
      name: validateName(name),
    ));
  }

  Future<void> _handleSubmitButtonPressed(
    Emitter<EditProfileState> emit,
  ) async {
    final isNameValid = state.name.isRight();
    Either<Failure, String>? failureOrPath;
    Either<Failure, Unit>? failureOrSuccess;
    late User newUser;

    if (isNameValid) {
      emit(state.copyWith(
        isSubmitting: true,
        failureOrSuccessOption: none(),
      ));

      final name = state.name.getOrElse((_) => '');
      final user = getIt<AuthBloc>().state.whenOrNull(
            authenticated: (user) => user,
          )!;

      newUser = user.copyWith(name: name);

      // There is a picture selected
      if (state.profilePictureOption.isSome()) {
        final picture = state.profilePictureOption.toNullable()!;

        failureOrPath = await _uploadProfilePicture(
          picture: picture,
          userId: newUser.id,
        );

        // upload failed
        if (failureOrPath.isLeft()) {
          emit(state.copyWith(
            isSubmitting: false,
            errorMessagesShown: true,
            failureOrSuccessOption: optionOf(
              left<Failure, Unit>(failureOrPath.getLeft().toNullable()!),
            ),
          ));
          return;
        }

        newUser = newUser.copyWith(
          photoUrl: failureOrPath.getRight().toNullable(),
        );
      }

      failureOrSuccess = await _updateUserProfile(newUser);
    }

    emit(state.copyWith(
      isSubmitting: false,
      errorMessagesShown: true,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
