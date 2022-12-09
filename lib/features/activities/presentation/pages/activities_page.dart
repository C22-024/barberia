import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../bloc/appoinment_getter/appoinment_getter_bloc.dart';
import 'history_page.dart';
import 'process_page.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user =
        getIt<AuthBloc>().state.whenOrNull(authenticated: (user) => user)!;
    return BlocProvider(
      create: (context) => getIt<AppoinmentGetterBloc>()
        ..add(AppoinmentGetterEvent.getAllStarted(user.id)),
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
                  child: BText.titleMedium('Dalam Proses'),
                ),
                Tab(
                  child: BText.titleMedium('Riwayat'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProcessView(),
              HistoryView(),
            ],
          ),
        ),
      ),
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
