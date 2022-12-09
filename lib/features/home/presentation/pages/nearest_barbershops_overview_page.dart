import 'package:barberia/common_widgets/loading_placeholder.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/error_placeholder.dart';
import '../bloc/home_page_bloc/home_page_bloc.dart';
import '../widgets/empty_nearest_barbershop_placeholder.dart';

class NearestBarbershopsOverviewPage extends StatelessWidget {
  const NearestBarbershopsOverviewPage({super.key, required this.homePageBloc});

  final HomePageBloc homePageBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homePageBloc,
      child: Scaffold(
        appBar: BAppBar(title: BText.titleSmall('Di sekitarmu')),
        body: BlocBuilder<HomePageBloc, HomePageState>(
          buildWhen: (p, c) =>
              p.nearestBarbershopsState != c.nearestBarbershopsState,
          builder: (context, state) {
            return state.nearestBarbershopsState.maybeWhen(
              loadSuccess: (barbershops) {
                if (barbershops.isEmpty) {
                  return const EmptyNearestBarbershopPlaceholder();
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: barbershops.length,
                  itemBuilder: (context, index) {
                    final barbershop = barbershops[index];
                    return BListTile(
                      onTap: () => context.pushNamed('barbershops',
                          params: {'id': barbershop.id}),
                      prefix: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: barbershop.photoUrl == null
                            ? Image.asset(
                                'assets/images/welcome_background.png',
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: barbershop.photoUrl!,
                                width: 64,
                                height: 64,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                              ),
                      ),
                      title: BText.highlightMedium(barbershop.name),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: BColors.warning,
                            size: 16,
                          ),
                          BText.body(
                            '${barbershop.rating}',
                            emphasis: Emphasis.less,
                          ),
                        ],
                      ),
                      suffix: Column(
                        children: [
                          BText.highlightMedium(
                            barbershop.distance.toStringAsFixed(2),
                          ),
                          BText.titleSmall('km')
                        ],
                      ),
                    );
                  },
                );
              },
              loadFailure: (_) => const ErrorPlaceholder(),
              orElse: () => const LoadingPlaceholder(),
            );
          },
        ),
      ),
    );
  }
}
