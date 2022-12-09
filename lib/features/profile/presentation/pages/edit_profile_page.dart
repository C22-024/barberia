import 'dart:io';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/spacing.dart';
import '../../../../constants/failure_messages.dart';
import '../../../../injection.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../bloc/edit_profile_bloc/edit_profile_bloc.dart';
import '../bloc/get_profile_picture_bloc/get_profile_picture_bloc.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetProfilePictureBloc>(),
      child: BlocProvider(
        create: (context) => getIt<EditProfileBloc>()..add(const EditProfileEvent.userProfileRequested()),
        child: BlocListener<EditProfileBloc, EditProfileState>(
          listenWhen: (previous, current) => previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) {
            final errorMessage = state.failureOrSuccessOption.fold(
              () => null,
              (failureOrSucces) => failureOrSucces.fold(
                (failure) => failure.when(
                  timeout: () => FailureMessages.timeout,
                  unexpected: (_, __, ___) => FailureMessages.unexpected,
                ),
                (_) => null,
              ),
            );

            if (errorMessage != null) {
              FlushbarHelper.createError(message: errorMessage).show(context);
            }
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: BAppBar(
                title: BText.titleSmall('Edit Profil'),
                leading: Center(
                  child: BIconButton.circle(
                    onPressed: () {
                      context.pop();
                    },
                    variant: BButtonVariant.bare,
                    size: BWidgetSize.medium,
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
              body: const _ProfileSetupPageBody(),
              bottomSheet: BlocBuilder<EditProfileBloc, EditProfileState>(
                buildWhen: (previous, current) => previous.isSubmitting != current.isSubmitting,
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: BButton(
                      label: 'Simpan',
                      busy: state.isSubmitting,
                      onPressed: () =>
                          context.read<EditProfileBloc>().add(const EditProfileEvent.submitButtonPressed()),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileSetupPageBody extends StatelessWidget {
  const _ProfileSetupPageBody();

  Widget _buildAvatar(
    BuildContext context,
    EditProfileState state,
  ) {
    final width = MediaQuery.of(context).size.width;
    final radius = 0.25 * width;

    final initialName = getIt<AuthBloc>().state.whenOrNull(authenticated: (user) => user.email.substring(0, 1));
    return Padding(
      padding: EdgeInsets.only(top: ((width - (radius * 2)) / 4) - 16),
      child: CircleAvatar(
        backgroundColor: BColors.info,
        foregroundImage: state.profilePictureOption.isSome()
            ? FileImage(state.profilePictureOption.getOrElse(() => File('')))
            : state.profilePictureRemote != null
                ? MemoryImage(state.profilePictureRemote!) as ImageProvider
                : null,
        radius: radius,
        child: state.profilePictureOption.isNone()
            ? BText(
                initialName ?? 'B',
                style: baseTextStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 0.5 * radius,
                  color: BColors.onInfo,
                ),
              )
            : null,
      ),
    );
  }

  void _openImagePicker(BuildContext context) {
    context.read<EditProfileBloc>().add(const EditProfileEvent.imagePickerOpened());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            // Avatar
            GestureDetector(
              onTap: () => _openImagePicker(context),
              child: BlocBuilder<EditProfileBloc, EditProfileState>(
                buildWhen: (previous, current) =>
                    previous.profilePictureOption != current.profilePictureOption ||
                    previous.profilePictureRemote != current.profilePictureRemote,
                builder: _buildAvatar,
              ),
            ),
            verticalSpace16,
            // Change photo button
            BButton(
              label: 'Ubah Foto',
              variant: BButtonVariant.bare,
              size: BWidgetSize.small,
              dense: true,
              onPressed: () => _openImagePicker(context),
            ),
            verticalSpace32,
            BlocBuilder<EditProfileBloc, EditProfileState>(
              buildWhen: (previous, current) =>
                  previous.errorMessagesShown != current.errorMessagesShown || previous.name != current.name,
              builder: (context, state) {
                return BTextFormField(
                  autovalidateMode: state.errorMessagesShown ? AutovalidateMode.always : AutovalidateMode.disabled,
                  hintText: state.name.fold((l) => 'Nama Kamu', (r) => r),
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  onChanged: (name) {
                    context.read<EditProfileBloc>().add(EditProfileEvent.nameChanged(name));
                  },
                  validator: (_) {
                    return context.read<EditProfileBloc>().state.name.fold(
                          (failure) => failure.message,
                          (_) => null,
                        );
                  },
                );
              },
            ),
            verticalSpace16,
            BText.caption(
              'Kamu bisa isi dengan nama lengkap atau panggilanmu.\n'
              'Nama ini akan ditampilkan ke barbershop yang kamu pesan.',
              maxLines: 4,
              emphasis: Emphasis.less,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
