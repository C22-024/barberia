import 'package:barberia/common_widgets/spacing.dart';
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
    final user = getIt<AuthBloc>().state.whenOrNull(authenticated: (user) => user)!;
    return BlocProvider(
      create: (context) => getIt<AppoinmentGetterBloc>()..add(AppoinmentGetterEvent.getAllStarted(user.id)),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: BAppBar(
            title: BText.titleSmall('Aktivitas'),
            bottom: TabBar(
              indicatorColor: BColors.primary,
              tabs: [
                Tab(
                  child: BText.titleSmall('Dalam Proses'),
                ),
                Tab(
                  child: BText.titleSmall('Riwayat'),
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
          const Icon(
            Icons.history_rounded,
            size: 100,
          ),
          verticalSpace16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                BText.highlightMedium('Tidak Ada Riwayat Pemesanan!'),
                verticalSpace4,
                BText(
                  'Coba pesan layanan yang disediakan oleh barbershop yang ada.',
                  style: bodySmall,
                  maxLines: 2,
                  align: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: BButton(
              label: 'Mulai memesan',
              variant: BButtonVariant.primary,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
