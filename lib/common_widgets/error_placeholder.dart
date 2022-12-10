import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/spacing.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.sentiment_dissatisfied_rounded,
            color: BColors.negative,
            size: 64,
          ),
          verticalSpace8,
          BText(
            'Duh, ada kesalahan saat memuat data.',
            style: bodyStyle.copyWith(color: BColors.negative),
          ),
        ],
      ),
    );
  }
}
