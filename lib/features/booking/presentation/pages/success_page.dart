import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/spacing.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check,
              color: BColors.positive,
              size: 64,
            ),
            verticalSpace8,
            BText(
              'Yeay, pesananmu berhasil dibuat!',
              style: bodyStyle.copyWith(color: BColors.positive),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BButton(
          label: 'Lihat Aktivitas',
          variant: BButtonVariant.positive,
          onPressed: () => context.goNamed('activities'),
        ),
      ),
    );
  }
}
