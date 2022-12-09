import 'package:barberia/features/activities/presentation/pages/process_page.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/appoinment_getter/appoinment_getter_bloc.dart';
import 'activities_page.dart';

class HistoryView extends StatelessWidget {
  final List<String> appointmentHistory = <String>[
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
            if (appointments.isEmpty) {
              return const EmptyView();
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: appointments.length,
              itemBuilder: (BuildContext context, int index) {
                if (appointmentHistory
                    .contains(appointments[index].status['code'])) {
                  return BCard(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 5),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Image.asset('assets/images/barberia.png'),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BText.titleSmall(
                                  appointments[index].barbershop['name'],
                                ),
                                StatusAppointment(
                                    status: appointments[index].status['code']),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BText.caption('16 Nov, 14:00'),
                                    BText.caption(
                                        'Rp ${appointments[index].services![0]['price']}'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              },
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
