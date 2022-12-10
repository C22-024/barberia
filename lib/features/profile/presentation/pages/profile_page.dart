import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common_widgets/spacing.dart';
import '../../../../injection.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../bloc/get_profile_picture_bloc/get_profile_picture_bloc.dart';
import '../widget/profile_menu_widget.dart';
import '../widget/profile_picture_widget.dart';

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
        body: SingleChildScrollView(
          child: Column(
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
                    physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}

final profileMenuList = [
  const ProfileMenuWidget(
    title: 'Pesanan',
    icon: Icons.post_add_rounded,
    goNamed: 'activities',
  ),
  const ProfileMenuWidget(
    title: 'Ganti kata sandi',
    icon: Icons.shield_rounded,
    goNamed: 'change-password',
  ),
  const ProfileMenuWidget(
    title: 'Barbershop favorit',
    icon: Icons.bookmark_rounded,
    goNamed: 'favorit',
    isCommingSoon: true,
  ),
  ProfileMenuWidget(
    title: 'Ajak teman pakai barbaria',
    icon: Icons.people_alt_rounded,
    onTap: () async {
      await Share.share(
        'Ayo cari barbershop menggunakan Barberia, cepat, sederhana, dan aman untuk mencari tempat potong rambut terdekat. Dapatkan di https://github.com/C22-024',
        subject: 'Berbagi Aplikasi Barberia',
      );
    },
  ),
  const ProfileMenuWidget(
    title: 'Notifikasi',
    icon: Icons.notifications_rounded,
    goNamed: 'notification',
    isCommingSoon: true,
  ),
  const ProfileMenuWidget(
    title: 'Atur akun',
    icon: Icons.link_rounded,
    goNamed: 'account',
    isCommingSoon: true,
  ),
  ProfileMenuWidget(
    title: 'Bantuan & laporan',
    icon: Icons.help_outline_rounded,
    onTap: () async {
      final Uri url = Uri.parse('https://github.com/C22-024');
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    },
  ),
];
