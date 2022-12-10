import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../bloc/appoinment_getter/appoinment_getter_bloc.dart';
import '../widgets/activity_item_card_widget.dart';
import 'activities_page.dart';

class ProcessView extends StatelessWidget {
  ProcessView({super.key});

  final List<String> filterStatusOnProgress = <String>[
    'waitingForPayment',
    'paid',
    'accepted',
    'ongoing',
  ];

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('id', timeago.IdMessages());
    return BlocBuilder<AppoinmentGetterBloc, AppoinmentGetterState>(
      builder: (context, state) {
        return state.maybeWhen(
          failure: (failure) => Center(
            child: BText.body('Failed'),
          ),
          success: (appointments) {
            final appointmentsResult = appointments
                .where((element) =>
                    filterStatusOnProgress.contains(element.status['code']))
                .toList();
            if (appointmentsResult.isEmpty) {
              return EmptyView(
                iconData: Icons.history_edu_rounded,
                title: 'Tidak ada pesanan berlangsung',
                child: BButton(
                  label: 'Mulai memesan',
                  variant: BButtonVariant.primary,
                  onPressed: () {
                    context.goNamed('home');
                  },
                ),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: appointmentsResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return ActivityItemCard(
                      appointment: appointmentsResult[index]);
                },
              );
            }
          },
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
