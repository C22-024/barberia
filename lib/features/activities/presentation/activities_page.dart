import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: activities.length,
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
                      BText.titleSmall(activities[index]),
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

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
