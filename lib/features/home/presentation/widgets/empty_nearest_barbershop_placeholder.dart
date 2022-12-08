import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/spacing.dart';

class EmptyNearestBarbershopPlaceholder extends StatelessWidget {
  const EmptyNearestBarbershopPlaceholder({super.key});

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
          BText('Yah, ngga ada barbershop di sekitarmu, nih.',
              style: bodyStyle.copyWith(color: BColors.negative))
        ],
      ),
    );
  }
}
