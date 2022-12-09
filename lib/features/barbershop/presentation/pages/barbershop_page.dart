import 'dart:async';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/error_placeholder.dart';
import '../../../../common_widgets/loading_placeholder.dart';
import '../../../../common_widgets/spacing.dart';
import '../../../../injection.dart';
import '../../domain/entities/barbershop.dart';
import '../../domain/entities/opening_hours.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/service.dart';
import '../bloc/barbershop/barbershop_bloc.dart';

class BarbershopPage extends StatelessWidget {
  const BarbershopPage({super.key, required this.barbershopId});

  final String barbershopId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BarbershopBloc>()
        ..add(BarbershopEvent.initialized(barbershopId)),
      child: BlocBuilder<BarbershopBloc, BarbershopState>(
        buildWhen: (p, c) => p.barbershopDetailState != c.barbershopDetailState,
        builder: (context, state) {
          return state.barbershopDetailState.maybeWhen(
            loadSuccess: (barbershop) => _DetailPage(barbershop),
            loadFailure: (_) => const _ErrorPage(),
            orElse: () => const _LoadingPage(),
          );
        },
      ),
    );
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar.defaultWithBackButton(context, 'Detail Barbershop'),
      body: const LoadingPlaceholder(),
    );
  }
}

class _ErrorPage extends StatelessWidget {
  const _ErrorPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar.defaultWithBackButton(context, 'Detail Barbershop'),
      body: const ErrorPlaceholder(),
    );
  }
}

class _DetailPage extends StatefulWidget {
  const _DetailPage(this.barbershop);

  final Barbershop barbershop;

  @override
  State<_DetailPage> createState() => __DetailPageState();
}

class __DetailPageState extends State<_DetailPage>
    with SingleTickerProviderStateMixin {
  final double appBarHeight = 56 + 128 + 56;
  late final Barbershop barbershop;
  late final TabController _tabController;
  late final ScrollController _scrollController;
  late final SliverOverlapAbsorberHandle appBarHandle;
  late final SliverOverlapAbsorberHandle tabBarHandle;

  ImageProvider _resolveProfilePictureProvider(String? photoUrl) {
    if (photoUrl != null) {
      return CachedNetworkImageProvider(photoUrl);
    }
    return const AssetImage(
      'assets/images/welcome_background.png',
    );
  }

  @override
  void initState() {
    appBarHandle = SliverOverlapAbsorberHandle();
    tabBarHandle = SliverOverlapAbsorberHandle();
    barbershop = widget.barbershop;
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _FloatingBookButton(_scrollController),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, _) => [
          SliverOverlapAbsorber(
            handle: appBarHandle,
            sliver: SliverAppBar(
              expandedHeight: appBarHeight,
              pinned: true,
              elevation: 0,
              backgroundColor: BColors.background,
              leading: Center(
                child: BIconButton.circle(
                  onPressed: () => context.pop(),
                  variant: BButtonVariant.bare,
                  size: BWidgetSize.small,
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: BText.titleSmall(barbershop.name),
                titlePadding:
                    const EdgeInsetsDirectional.only(start: 0, bottom: 56 + 16),
                centerTitle: true,
                background: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        DecoratedBox(
                          position: DecorationPosition.foreground,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                BColors.neutral1000,
                                BColors.neutral1000t32,
                              ],
                            ),
                          ),
                          child: _BannerPicture(
                            barbershop.bannerUrl,
                            appBarHeight +
                                MediaQuery.of(context).padding.top -
                                56,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 56 + 16),
                          child: CircleAvatar(
                            radius: BWidgetSize.medium.value,
                            backgroundColor: BColors.transparent,
                            foregroundImage: _resolveProfilePictureProvider(
                              barbershop.photoUrl,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: _InfoList(barbershop),
              ),
            ),
          ),
          SliverOverlapAbsorber(
            handle: tabBarHandle,
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: _PersistentTabBar(_tabController),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            _GalleryView(appBarHandle, tabBarHandle),
            _ServicesView(appBarHandle, tabBarHandle),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

class _FloatingBookButton extends StatefulWidget {
  const _FloatingBookButton(this.controller);

  final ScrollController controller;

  @override
  State<_FloatingBookButton> createState() => __FloatingBookButtonState();
}

class __FloatingBookButtonState extends State<_FloatingBookButton> {
  late bool isVisible;
  Timer? showButtonTimer;

  @override
  void initState() {
    isVisible = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.addListener(_scrollDirectionListener);
      widget.controller.position.isScrollingNotifier
          .addListener(_scrollingStatusListener);
    });
    super.initState();
  }

  void _scrollingStatusListener() {
    if (widget.controller.position.isScrollingNotifier.value) {
      showButtonTimer?.cancel();
    } else {
      showButtonTimer = Timer(
        const Duration(seconds: 1),
        () {
          if (!isVisible) {
            setState(() {
              isVisible = true;
            });
          }
        },
      );
    }
  }

  void _scrollDirectionListener() {
    switch (widget.controller.position.userScrollDirection) {
      case ScrollDirection.reverse:
        setState(() {
          isVisible = false;
        });
        break;
      case ScrollDirection.forward:
      case ScrollDirection.idle:
        setState(() {
          isVisible = true;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BButton(
          label: 'Pesan sekarang',
          size: BWidgetSize.medium,
          elevation: 4,
          onPressed: () {
            final serviceCount = context
                    .read<BarbershopBloc>()
                    .state
                    .servicesState
                    .whenOrNull(loadSuccess: (services) => services.length) ??
                0;
            if (serviceCount == 0) {
              FlushbarHelper.createInformation(message: 'Belum ada layanan')
                  .show(context);
            }
            // TODO: go to book page
          },
        ),
      ),
    );
  }
}

class _PersistentTabBar extends SliverPersistentHeaderDelegate {
  _PersistentTabBar(this.controller) : height = BWidgetSize.medium.value;

  final TabController controller;
  final double height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Center(
      child: DecoratedBox(
        decoration: const BoxDecoration(color: BColors.transparent),
        child: TabBar(
          controller: controller,
          tabs: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: height,
                maxHeight: height,
              ),
              child: Center(child: BText.titleSmall('Galeri')),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: height,
                maxHeight: height,
              ),
              child: Center(child: BText.titleSmall('Layanan')),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _BannerPicture extends StatelessWidget {
  const _BannerPicture(this.bannerUrl, this.appBarHeight);

  final String? bannerUrl;
  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    if (bannerUrl != null) {
      return CachedNetworkImage(
        imageUrl: bannerUrl!,
        placeholder: (_, __) => const LoadingPlaceholder(),
        fit: BoxFit.cover,
        height: appBarHeight,
        width: double.infinity,
      );
    }
    return Image.asset(
      'assets/images/welcome_background.png',
      fit: BoxFit.cover,
      height: appBarHeight,
      width: double.infinity,
    );
  }
}

class _InfoList extends StatefulWidget {
  const _InfoList(this.barbershop);

  final Barbershop barbershop;

  @override
  State<_InfoList> createState() => _InfoListState();
}

class _InfoListState extends State<_InfoList> {
  final controller = ScrollController();
  List<double> gradientStops = [0, 0, 0.5, 1, 1];
  late final Barbershop barbershop;

  @override
  void initState() {
    barbershop = widget.barbershop;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.hasClients) {
        setState(() {
          gradientStops = _resolveGradientStops();
        });
      }
    });

    controller.addListener(() {
      if (controller.hasClients) {
        setState(() {
          gradientStops = _resolveGradientStops();
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<double> _resolveGradientStops() {
    if (controller.position.maxScrollExtent > 0) {
      if (controller.offset == 0) {
        return [0, 0, 0.5, 0.7, 1];
      }
      if (controller.offset == controller.position.maxScrollExtent) {
        return [0, 0.3, 0.5, 1, 1];
      }
      return [0, 0.3, 0.5, 0.7, 1];
    }
    return [0, 0, 0.5, 1, 1];
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            BColors.neutral1000,
            BColors.transparent,
            BColors.transparent,
            BColors.transparent,
            BColors.neutral1000,
          ],
          stops: gradientStops,
        ),
      ),
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56, maxHeight: 56),
          child: Row(
            children: [
              _InfoListTile.defaultItem(
                iconData: Icons.star,
                iconColor: BColors.warning,
                title: '${barbershop.rating}',
                label: '${barbershop.reviewCount} penilaian',
              ),
              const _VerticalDivider(),
              _InfoListTile.defaultItem(
                iconData: Icons.location_pin,
                title: '${barbershop.distance.toStringAsFixed(2)} km',
                label: 'Jarak',
              ),
              const _VerticalDivider(),
              _OpeningHoursTile(barbershop.openingHours),
              const _VerticalDivider(),
              _InfoListTile.defaultItem(
                iconData: Icons.book,
                title: '${barbershop.completedAppointmentCount} Booking',
                label: 'Diselesaikan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OpeningHoursTile extends StatelessWidget {
  const _OpeningHoursTile(this.openingHours);

  final OpeningHours openingHours;

  String parseOpeningHour(int time) {
    final hour = time ~/ 60;
    final minute = time - hour * 60;
    final hourString = hour >= 10 ? '$hour' : '0$hour';
    final minuteString = minute >= 10 ? '$minute' : '0$minute';

    return '$hourString.$minuteString';
  }

  @override
  Widget build(BuildContext context) {
    final today = DateFormat.E().format(DateTime.now());

    final openingHour = openingHours.getOpeningHour(today);

    if (openingHour.isOpen) {
      final now = TimeOfDay.now();
      final nowTime = now.hour * 60 + now.minute;
      final isOpenNow =
          nowTime >= openingHour.openTime! && nowTime <= openingHour.closeTime!;

      final openTimeString = parseOpeningHour(openingHour.openTime!);
      final closeTimeString = parseOpeningHour(openingHour.closeTime!);

      return _InfoListTile.defaultItem(
        iconData: isOpenNow ? Icons.watch_later : Icons.lock_clock,
        iconColor: isOpenNow ? BColors.secondaryTextColor : BColors.negative,
        title: '$openTimeString - $closeTimeString',
        label: 'Hari ini',
      );
    }
    return _InfoListTile.defaultItem(
      iconData: Icons.lock_clock,
      iconColor: BColors.negative,
      title: 'Libur',
      label: 'Hari ini',
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      indent: 4,
      endIndent: 4,
      color: BColors.disabled,
    );
  }
}

class _InfoListTile extends StatelessWidget {
  /// At least one of [icon] and [title] is not null.
  const _InfoListTile({
    this.icon,
    this.title,
    required this.label,
  }) : assert(!(icon == null && title == null));

  factory _InfoListTile.defaultItem({
    required IconData iconData,
    Color iconColor = BColors.secondaryTextColor,
    required String title,
    required String label,
  }) {
    return _InfoListTile(
      icon: Icon(
        iconData,
        color: iconColor,
        size: 16,
      ),
      title: title,
      label: label,
    );
  }

  final Widget? icon;
  final String? title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 20,
            maxHeight: 20,
          ),
          child: Row(
            children: [
              if (icon != null) icon!,
              if (icon != null && title != null) horizontalSpace4,
              if (title != null) BText.highlightSmall(title!),
            ],
          ),
        ),
        BText.caption(label),
      ],
    );
  }
}

class _GalleryView extends StatelessWidget {
  const _GalleryView(this.appBarHandle, this.tabBarHandle);

  final SliverOverlapAbsorberHandle appBarHandle;
  final SliverOverlapAbsorberHandle tabBarHandle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarbershopBloc, BarbershopState>(
      buildWhen: (p, c) => p.postsState != c.postsState,
      builder: (context, state) {
        return state.postsState.maybeWhen(
          loadSuccess: (posts) {
            if (posts.isNotEmpty) {
              return _PostGridView(posts, appBarHandle, tabBarHandle);
            }
            return const _NoPostPlaceholder();
          },
          loadFailure: (_) => const ErrorPlaceholder(),
          orElse: () => const LoadingPlaceholder(),
        );
      },
    );
  }
}

class _NoPostPlaceholder extends StatelessWidget {
  const _NoPostPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 56 + 56 + 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.hide_image_outlined,
              color: BColors.secondaryTextColor,
              size: 64,
            ),
            verticalSpace8,
            BText(
              'Belum ada post',
              style: bodyStyle.copyWith(color: BColors.secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostGridView extends StatelessWidget {
  const _PostGridView(this.posts, this.appBarHandle, this.tabBarHandle);

  final List<Post> posts;
  final SliverOverlapAbsorberHandle appBarHandle;
  final SliverOverlapAbsorberHandle tabBarHandle;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const PageStorageKey<String>('gallery'),
      slivers: [
        SliverOverlapInjector(
          handle: appBarHandle,
        ),
        SliverOverlapInjector(
          handle: tabBarHandle,
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return CachedNetworkImage(
                imageUrl: posts[index].photoUrl,
                placeholder: (context, url) =>
                    const ColoredBox(color: BColors.neutral400),
                fadeInDuration: const Duration(seconds: 1),
                fit: BoxFit.cover,
              );
            },
            childCount: posts.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
        ),
      ],
    );
  }
}

class _ServicesView extends StatelessWidget {
  const _ServicesView(this.appBarHandle, this.tabBarHandle);

  final SliverOverlapAbsorberHandle appBarHandle;
  final SliverOverlapAbsorberHandle tabBarHandle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarbershopBloc, BarbershopState>(
      buildWhen: (p, c) => p.servicesState != c.servicesState,
      builder: (context, state) {
        return state.servicesState.maybeWhen(
          loadSuccess: (services) {
            if (services.isNotEmpty) {
              return _ServiceListView(services, appBarHandle, tabBarHandle);
            }
            return const _NoServicePlaceholder();
          },
          loadFailure: (_) => const ErrorPlaceholder(),
          orElse: () => const LoadingPlaceholder(),
        );
      },
    );
  }
}

class _NoServicePlaceholder extends StatelessWidget {
  const _NoServicePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 56 + 56 + 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cut,
              color: BColors.secondaryTextColor,
              size: 64,
            ),
            verticalSpace8,
            BText(
              'Belum ada layanan',
              style: bodyStyle.copyWith(color: BColors.secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceListView extends StatelessWidget {
  const _ServiceListView(this.services, this.appBarHandle, this.tabBarHandle);

  final List<Service> services;
  final SliverOverlapAbsorberHandle appBarHandle;
  final SliverOverlapAbsorberHandle tabBarHandle;

  String parseDurationInMinutes(int durationInMinutes) {
    if (durationInMinutes < 60) {
      return '$durationInMinutes menit';
    }
    final hours = durationInMinutes ~/ 60;
    final minutes = durationInMinutes - hours * 60;

    return '$hours jam $minutes menit';
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const PageStorageKey<String>('services'),
      slivers: [
        SliverOverlapInjector(handle: appBarHandle),
        SliverOverlapInjector(handle: tabBarHandle),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final service = services[index];
              return BListTile(
                title: BText.titleMedium(service.name),
                subtitle: BText.body(
                  parseDurationInMinutes(service.durationInMinutes),
                ),
                suffix: BText.highlightSmall(NumberFormat.currency(
                  locale: 'id_ID',
                  decimalDigits: 0,
                  symbol: 'Rp',
                ).format(service.price)),
              );
            },
            childCount: services.length,
          ),
        ),
      ],
    );
  }
}
