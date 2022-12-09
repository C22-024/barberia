import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/spacing.dart';
import '../../../../injection.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../bloc/get_profile_picture_bloc/get_profile_picture_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getIt<AuthBloc>().state.whenOrNull(authenticated: (user) => user)!;
    return BlocProvider(
      create: (context) => getIt<GetProfilePictureBloc>(),
      child: Scaffold(
        appBar: BAppBar(
          title: BText.titleSmall('Profileku'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BListTile(
                  onTap: () {
                    context.pushNamed('edit-profile');
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  prefix: ProfilePictureWidget(user: user),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: BText.highlightMedium(user.name.toString()).copyWith(maxLines: 2),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: BText.body(user.email.toLowerCase().toString()),
                  ),
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.edit_rounded),
                    ],
                  ),
                ),
                verticalSpace8,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: BText.titleSmall('Akun'),
                ),
                verticalSpace8,
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return profileMenuList[index];
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 54),
                      child: Container(
                        height: 1,
                        color: Colors.white12,
                      ),
                    );
                  },
                  itemCount: profileMenuList.length,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: BButton(
                label: 'Keluar',
                variant: BButtonVariant.negative,
                onPressed: () {
                  getIt<AuthBloc>().add(const AuthEvent.signedOutRequested());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    this.icon = Icons.question_mark_rounded,
    this.pushNamed = '/',
  });

  final String title;
  final IconData icon;
  final String pushNamed;

  @override
  Widget build(BuildContext context) {
    return BListTile(
      onTap: () => context.pushNamed(pushNamed),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      prefix: Icon(
        icon,
        size: 24,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: BText.titleMedium(title),
      ),
      suffix: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 14,
      ),
    );
  }
}

final profileMenuList = [
  const ProfileMenu(
    title: 'Pesanan',
    icon: Icons.post_add_rounded,
    pushNamed: 'pesanan',
  ),
  // const ProfileMenu(
  //   title: 'Barbershop favorit',
  //   icon: Icons.bookmark_rounded,
  //   goNamed: 'favorit',
  // ),
  // const ProfileMenu(
  //   title: 'Ajak teman pakai barbaria',
  //   icon: Icons.people_alt_rounded,
  //   goNamed: 'share',
  // ),
  // const ProfileMenu(
  //   title: 'Notifikasi',
  //   icon: Icons.notifications_rounded,
  //   pushNamed: 'notification',
  // ),
  // const ProfileMenu(
  //   title: 'Atur akun',
  //   icon: Icons.link_rounded,
  //   goNamed: 'account',
  // ),
  const ProfileMenu(
    title: 'Ganti kata sandi',
    icon: Icons.shield_rounded,
    pushNamed: 'change-password',
  ),
  // const ProfileMenu(
  //   title: 'Bantuan & laporan',
  //   icon: Icons.help_outline_rounded,
  //   goNamed: 'support',
  // ),
];
