import 'package:barberia/constants/appointment_status_code.dart';
import 'package:barberia/features/activities/presentation/pages/activities_page.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/appoinment_getter/appoinment_getter_bloc.dart';

class ProcessView extends StatelessWidget {
  final List<String> AppointmentOnProgress = <String>[
    'waitingForPayment',
    'paid',
    'accepted',
    'ongoing',
  ];

  ProcessView({super.key});

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
            if (AppointmentOnProgress.contains(
                appointments[appointments.length - 1].status['code'])) {
              return Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 400, left: 15, right: 15),
                child: BCard(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 5),
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
                              BText.titleMedium(
                                appointments[appointments.length - 1]
                                    .barbershop['name'],
                              ),
                              Container(
                                child: BText.body(
                                  statusToBahasa[
                                      appointments[appointments.length - 1]
                                          .status['code']]!,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BText.caption('16 Nov, 14:00'),
                                  BText.caption(
                                    'Rp ${appointments[appointments.length - 1].services![0]['price']}',
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: BText.body('Anda sedang tidak memproses apapun'),
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
