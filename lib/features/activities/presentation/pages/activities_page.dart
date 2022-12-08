import 'package:barberia/features/activities/presentation/bloc/appoinment_getter/appoinment_getter_bloc.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppoinmentGetterBloc>()
        ..add(const AppoinmentGetterEvent.getAllStarted()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: BAppBar(
            centerTitle: false,
            title: BText.titleLarge('Aktivitas'),
            bottom: TabBar(
              indicatorColor: BColors.primary,
              tabs: [
                Tab(
                  child: BText.titleMedium('Riwayat'),
                ),
                Tab(
                  child: BText.titleMedium('Jadwal'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              HistoryView(),
              ScheduleView(),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryView extends StatelessWidget {
  final List<String> activities = <String>[
    'Cepmek Barbershop',
    'United Barbershop',
    'Mini Barbershop',
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
                                  appointments[index].barbershop['name']),
                              BText.body(appointments[index].status['code']),
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

class ScheduleView extends StatelessWidget {
  final List<String> schedule = <String>[
    'United Barbershop',
  ];

  ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: schedule.length,
      itemBuilder: (BuildContext context, int index) {
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
                      BText.titleSmall(schedule[index]),
                      BText.body('Pangkas selesai'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BText.caption('16 Nov, 14:00'),
                          BText.caption('Rp 30.000'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BText.titleLarge('Tidak Ada Riwayat Pemesanan!'),
          BText.titleSmall(
            'Coba pesan layanan yang disediakan oleh barbershop yang ada.',
            maxLines: 2,
            align: TextAlign.center,
            emphasis: Emphasis.normal,
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(15),
            child: BButton(
              label: 'Mulai memesan',
              variant: BButtonVariant.positive,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
