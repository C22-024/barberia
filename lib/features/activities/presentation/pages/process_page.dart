import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../bloc/appoinment_getter/appoinment_getter_bloc.dart';
import '../widgets/status_appointment_widget.dart';
import 'activities_page.dart';

class ProcessView extends StatelessWidget {
  final List<String> appointmentOnProgress = <String>[
    'waitingForPayment',
    'paid',
    'accepted',
    'ongoing',
  ];

  ProcessView({super.key});

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
            if (appointments.isEmpty) {
              return const EmptyView();
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: appointments.length,
              itemBuilder: (BuildContext context, int index) {
                final appointment = appointments[index];
                final date = DateTime.fromMillisecondsSinceEpoch(
                    appointment.status['updatedAt']);
                if (appointmentOnProgress
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
                            margin: const EdgeInsets.only(right: 10),
                            child: Image.asset('assets/images/activities.png'),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BText.titleSmall(
                                  appointment.barbershop['name'],
                                ),
                                StatusAppointment(
                                    status: appointment.status['code']),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BText.caption(
                                        timeago.format(date, locale: 'id')),
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
