import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia/features/home/presentation/widgets/empty_nearest_barbershop_placeholder.dart';
import 'package:barberia/features/home/presentation/widgets/error_placeholder.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/spacing.dart';
import '../../../../injection.dart';
import '../../domain/entitites/barbershop_overview.dart';
import '../bloc/home_page_bloc/home_page_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HomePageBloc>()..add(const HomePageEvent.initialized()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 48 + (40 + 8 + 8) + 128,
              toolbarHeight: 48,
              backgroundColor: BColors.background,
              title: BlocBuilder<HomePageBloc, HomePageState>(
                buildWhen: (p, c) => p.lastPlacemarker != c.lastPlacemarker,
                builder: (context, state) {
                  return Hero(
                    tag: 'locationButton',
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 192),
                      child: BButton(
                        label: state.lastPlacemarker.fold(
                          () => 'Memuat lokasimu...',
                          (lastPlacemarker) => lastPlacemarker,
                        ),
                        icon: Icons.location_pin,
                        dense: true,
                        textAlign: TextAlign.left,
                        size: BWidgetSize.small,
                        variant: BButtonVariant.bare,
                        onPressed: () => context.goNamed('location-settings'),
                      ),
                    ),
                  );
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: BText.display(
                      'Hai, mau cukur di mana hari ini?',
                      maxLines: 3,
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40 + 8),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: GestureDetector(
                    onTap: () => context.pushNamed('search'),
                    child: Hero(
                      tag: 'searchField',
                      child: Material(
                        type: MaterialType.transparency,
                        child: BTextFormField(
                          enabled: false,
                          filled: true,
                          hintText: 'Cari barbershop favoritmu',
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(
                              Icons.search_outlined,
                              color: BColors.neutral500,
                            ),
                          ),
                          size: BWidgetSize.medium,
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                const _BPointCard(),
                verticalSpace8,
                Builder(builder: (context) {
                  final homePageBloc = context.read<HomePageBloc>();
                  return _HorizontalListSection(
                    title: 'Di sekitarmu',
                    buttonLabel: 'Lihat detail',
                    content: const _NearestBarbershopOverviewList(),
                    onViewAllPressed: () => context.pushNamed(
                      'nearest-barbershops',
                      extra: homePageBloc,
                    ),
                  );
                }),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _BPointCard extends StatelessWidget {
  const _BPointCard();

  @override
  Widget build(BuildContext context) {
    return BCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: BColors.primary,
                borderRadius: borderRadius,
              ),
              constraints: const BoxConstraints(minWidth: 112, maxWidth: 112),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: BColors.info,
                        child: Icon(
                          Icons.currency_bitcoin,
                          color: BColors.onInfo,
                          size: 14,
                        ),
                      ),
                      horizontalSpace4,
                      BText(
                        'Poin',
                        style: captionStyle.copyWith(
                          color: BColors.onPrimary,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<HomePageBloc, HomePageState>(
                    buildWhen: (p, c) =>
                        p.currentBalanceState != c.currentBalanceState,
                    builder: (context, state) {
                      return BText(
                        state.currentBalanceState.maybeWhen(
                          loadSuccess: (currentBalance) =>
                              NumberFormat.currency(
                            locale: 'id_ID',
                            decimalDigits: 0,
                            symbol: '',
                          ).format(currentBalance),
                          loadFailure: (_) => 'Kesalahan',
                          orElse: () => 'Memuat...',
                        ),
                        style: highlightMediumStyle.copyWith(
                          color: state.currentBalanceState.maybeWhen(
                            loadFailure: (_) => BColors.negative,
                            orElse: () => BColors.onPrimary,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _VerticalButton(
                    label: 'Riwayat',
                    iconData: Icons.history_edu,
                    onTap: () {
                      FlushbarHelper.createInformation(message: 'Coming soon.')
                          .show(context);
                    },
                  ),
                  _VerticalButton(
                    label: 'Info',
                    iconData: Icons.info,
                    onTap: () => showModalBottomSheet(
                      useRootNavigator: true,
                      context: context,
                      backgroundColor: BColors.surface,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8)),
                      ),
                      builder: (context) => const _BPoinInfoModalBottomSheet(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalButton extends StatelessWidget {
  const _VerticalButton({
    required this.label,
    required this.iconData,
    required this.onTap,
  });

  final VoidCallback onTap;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(iconData),
          BText.highlightSmall(label),
        ],
      ),
    );
  }
}

class _BPoinInfoModalBottomSheet extends StatelessWidget {
  const _BPoinInfoModalBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BText.highlightMedium('Apa itu BPoin?'),
          verticalSpace8,
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BText.body(
                  'BPoin merupakan poin dari Barberia yang dapat kamu gunakan untuk bertransaksi di aplikasi Barberia.',
                  maxLines: 5,
                ),
                verticalSpace8,
                BText.titleMedium('Nilai tukar?'),
                BText.body(
                  'Nilai 1 BPoin setara dengan 1 Rupiah.',
                  maxLines: 5,
                ),
                verticalSpace8,
                BText.titleMedium('Cara topup?'),
                BText.body(
                  'BPoin tidak dapat kamu isi ulang ataupun kamu tarik. BPoin akan kamu dapatkan ketika kamu menerima biaya kembalian.',
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NearestBarbershopOverviewList extends StatelessWidget {
  const _NearestBarbershopOverviewList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      buildWhen: (p, c) =>
          p.nearestBarbershopsState != c.nearestBarbershopsState,
      builder: (context, state) {
        return state.nearestBarbershopsState.maybeWhen(
          loadSuccess: (barbershops) {
            if (barbershops.isEmpty) {
              return const EmptyNearestBarbershopPlaceholder();
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: barbershops.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (index == 0) horizontalSpace16,
                    _HorizontalListCard(
                      barbershop: barbershops[index],
                      buttonLabel: 'Lihat detail',
                      onPressed: () {
                        context.pushNamed('barbershops',
                            params: {'id': barbershops[index].id});
                      },
                    ),
                    horizontalSpace8,
                    if (index == 4) horizontalSpace32,
                  ],
                );
              },
            );
          },
          loadFailure: (_) => const ErrorPlaceholder(),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _HorizontalListSection extends StatelessWidget {
  const _HorizontalListSection({
    required this.title,
    required this.buttonLabel,
    required this.content,
    this.onViewAllPressed,
  });

  final String title;
  final String buttonLabel;
  final Widget content;
  final VoidCallback? onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BText.titleMedium(title),
              BButton(
                label: 'Lihat semua',
                dense: true,
                variant: BButtonVariant.bare,
                size: BWidgetSize.small,
                onPressed: onViewAllPressed,
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 264,
          ),
          child: content,
        ),
      ],
    );
  }
}

class _HorizontalListCard extends StatelessWidget {
  const _HorizontalListCard({
    required this.buttonLabel,
    required this.barbershop,
    this.onPressed,
  });

  final String buttonLabel;
  final VoidCallback? onPressed;
  final BarbershopOverview barbershop;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 256),
      child: BCard(
        margin: const EdgeInsets.all(4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BarbershopPicture(barbershop.bannerUrl, 256, 128),
            verticalSpace16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: borderRadius,
                    child: _BarbershopPicture(
                      barbershop.photoUrl,
                      48,
                      48,
                    ),
                  ),
                  horizontalSpace16,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BText.highlightSmall(barbershop.name),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: BColors.warning,
                            size: 16,
                          ),
                          BText.caption(
                            '${barbershop.rating} • ${barbershop.distance.toStringAsFixed(2)}km',
                            emphasis: Emphasis.less,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace16,
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: BButton(
                label: buttonLabel,
                size: BWidgetSize.medium,
                onPressed: onPressed ?? () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarbershopPicture extends StatelessWidget {
  const _BarbershopPicture(this.photoUrl, this.width, this.height);

  final String? photoUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (photoUrl == null) {
      return Image.asset(
        'assets/images/welcome_background.png',
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }
    return CachedNetworkImage(
      imageUrl: photoUrl!,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
    );
  }
}
