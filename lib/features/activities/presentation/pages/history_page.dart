import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/appoinment_getter/appoinment_getter_bloc.dart';
import '../widgets/activity_item_card_widget.dart';
import 'activities_page.dart';

class HistoryView extends StatelessWidget {
  final List<String> filterStatusHistory = <String>[
    'expired',
    'rejected',
    'autoCanceled',
    'completed',
    'canceledByUser',
    'canceledByBarbershop',
  ];

  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppoinmentGetterBloc, AppoinmentGetterState>(
      builder: (context, state) {
        return state.maybeWhen(
          failure: (failure) => Center(
            child: BText.body('Failed'),
          ),
          success: (appointments) {
            final appointmentsResult = appointments
                .where((element) =>
                    filterStatusHistory.contains(element.status['code']))
                .toList();
            if (appointmentsResult.isEmpty) {
              return EmptyView(
                iconData: Icons.history_rounded,
                title: 'Tidak ada riwayat pemesanan',
                subtitle:
                    'Coba pesan layanan yang disediakan oleh barbershop yang ada.',
                child: BButton(
                  label: 'Mulai memesan',
                  variant: BButtonVariant.primary,
                  onPressed: () {
                    context.goNamed('home');
                  },
                ),
              );
            }
            return Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                reverse: true,
                shrinkWrap: true,
                itemCount: appointmentsResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return ActivityItemCard(
                      appointment: appointmentsResult[index]);
                },
              ),
            );
          },
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
