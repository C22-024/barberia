import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/entities/user.dart';
import '../bloc/get_profile_picture_bloc/get_profile_picture_bloc.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final initialName = user.name!.substring(0, 1);
    context.read<GetProfilePictureBloc>().add(GetProfilePictureEvent.photoProfileRequested(user.photoUrl));
    return BlocBuilder<GetProfilePictureBloc, GetProfilePictureState>(
      builder: (context, state) {
        return CircleAvatar(
          radius: 50,
          backgroundColor: BColors.info,
          foregroundImage: state.whenOrNull(
            success: (profilePictureData) {
              if (profilePictureData == null) {
                return null;
              }
              return MemoryImage(profilePictureData);
            },
          ),
          child: state.maybeWhen(
            failure: (failure) => BText(
              initialName,
              style: baseTextStyle.copyWith(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: BColors.onInfo,
              ),
            ),
            success: (profilePictureData) {
              if (profilePictureData == null) {
                return BText(
                  initialName,
                  style: baseTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: BColors.onInfo,
                  ),
                );
              }
              return null;
            },
            orElse: () => const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
