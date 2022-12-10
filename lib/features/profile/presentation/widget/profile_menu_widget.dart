import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    this.icon = Icons.question_mark_rounded,
    this.onTap,
    this.goNamed,
    this.isCommingSoon = false,
  });

  final String title;
  final IconData icon;
  final String? goNamed;
  final VoidCallback? onTap;
  final bool isCommingSoon;

  @override
  Widget build(BuildContext context) {
    return BListTile(
      onTap: onTap ??
          () {
            if (isCommingSoon) {
              FlushbarHelper.createInformation(message: 'Coming soon.').show(context);
            } else if (goNamed != null) {
              context.goNamed(goNamed!);
            }
          },
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
