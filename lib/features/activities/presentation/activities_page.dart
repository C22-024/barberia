import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: BAppBar(
          title: BText.titleSmall('Aktivitas'),
          bottom: TabBar(
            tabs: [
              BText.titleSmall('Riwayat'),
              BText.titleSmall('Jadwal'),
            ],
          ),
        ),
      ),
    );
  }
}
