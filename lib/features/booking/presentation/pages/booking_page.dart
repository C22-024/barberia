import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../common_widgets/error_placeholder.dart';
import '../../../../common_widgets/loading_placeholder.dart';
import '../../../../common_widgets/spacing.dart';
import '../../../../constants/business_amounts.dart';
import '../../../../injection.dart';
import '../../domain/entities/appointment_service.dart';
import '../bloc/booking_form/booking_form_bloc.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key, required this.barbershopId});

  final String barbershopId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookingFormBloc>()
        ..add(BookingFormEvent.initialized(barbershopId)),
      child: Scaffold(
        appBar: BAppBar(
          title: BText.titleSmall('Pesan Barbershop'),
        ),
        body: BlocConsumer<BookingFormBloc, BookingFormState>(
          listenWhen: (p, c) =>
              p.failureOrSuccessOption != c.failureOrSuccessOption,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (failure) => null,
                (_) {
                  if (state.paymentUrl != null) {
                    launchUrlString(
                      state.paymentUrl!,
                      mode: LaunchMode.externalApplication,
                    )
                        .then((_) => context.replaceNamed('success'))
                        .onError((_, __) => FlushbarHelper.createError(
                              message: 'Gagal membuka halaman pembayaran.',
                            ));
                  } else {
                    context.replaceNamed('success');
                  }
                },
              ),
            );
          },
          buildWhen: (p, c) => p.getterState != c.getterState,
          builder: (context, state) {
            return state.getterState.maybeWhen(
              loadSuccess: () => const _Body(),
              loadFailure: () => const ErrorPlaceholder(),
              orElse: () => const LoadingPlaceholder(),
            );
          },
        ),
        bottomSheet: BlocBuilder<BookingFormBloc, BookingFormState>(
          buildWhen: (p, c) => p.getterState != c.getterState,
          builder: (context, state) {
            return state.getterState.maybeWhen(
              loadSuccess: () {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 128,
                    maxHeight: 128,
                    minWidth: double.infinity,
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: const BoxDecoration(
                      color: BColors.background,
                      border: Border(top: BorderSide(color: BColors.primary)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BText.titleSmall(NumberFormat.currency(
                                    locale: 'id_ID',
                                    decimalDigits: 0,
                                    symbol: '',
                                  ).format(state.currentBPoinBalance)),
                                  BText.caption('Pakai BPoin'),
                                ],
                              ),
                            ),
                            BlocSelector<BookingFormBloc, BookingFormState,
                                bool>(
                              selector: (state) {
                                return state.payWithBPoin;
                              },
                              builder: (context, payWithBPoin) {
                                return Switch.adaptive(
                                  value: payWithBPoin,
                                  onChanged: state.currentBPoinBalance == 0
                                      ? null
                                      : (value) {
                                          context.read<BookingFormBloc>().add(
                                                BookingFormEvent
                                                    .payWithBPoinChanged(value),
                                              );
                                        },
                                );
                              },
                            ),
                          ],
                        ),
                        verticalSpace4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BText.titleMedium('Total Bayar'),
                                BlocBuilder<BookingFormBloc, BookingFormState>(
                                  buildWhen: (p, c) =>
                                      p.selectedServices !=
                                          c.selectedServices ||
                                      p.payWithBPoin != c.payWithBPoin,
                                  builder: (context, state) {
                                    final int totalToPay;
                                    final total = context
                                        .read<BookingFormBloc>()
                                        .calculateTotal(state.selectedServices);
                                    if (state.payWithBPoin) {
                                      if (state.currentBPoinBalance >= total) {
                                        totalToPay = 0;
                                      } else {
                                        totalToPay =
                                            total - state.currentBPoinBalance;
                                      }
                                    } else {
                                      totalToPay = total;
                                    }

                                    return BText.highlightMedium(
                                        getIt<NumberFormat>()
                                            .format(totalToPay));
                                  },
                                ),
                              ],
                            ),
                            BlocBuilder<BookingFormBloc, BookingFormState>(
                              buildWhen: (p, c) =>
                                  p.isSubmitting != c.isSubmitting ||
                                  p.selectedServices != c.selectedServices ||
                                  p.selectedDateTimestamp !=
                                      c.selectedDateTimestamp,
                              builder: (context, state) {
                                return ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 192,
                                  ),
                                  child: BButton(
                                    onPressed: () {
                                      context.read<BookingFormBloc>().add(
                                          const BookingFormEvent
                                              .buttonPressed());
                                    },
                                    enabled:
                                        state.selectedServices.isNotEmpty &&
                                            state.selectedDateTimestamp != null,
                                    busy: state.isSubmitting,
                                    label: 'Konfirmasi & Bayar',
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  ImageProvider _resolveProfilePictureProvider(String? photoUrl) {
    if (photoUrl != null) {
      return CachedNetworkImageProvider(photoUrl);
    }
    return const AssetImage(
      'assets/images/welcome_background.png',
    );
  }

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
    final barbershop = context.read<BookingFormBloc>().state.barbershop!;
    final services = context.read<BookingFormBloc>().state.services!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BCard(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: BWidgetSize.small.value,
                    backgroundColor: BColors.transparent,
                    foregroundImage: _resolveProfilePictureProvider(
                      barbershop.photoUrl,
                    ),
                  ),
                  horizontalSpace16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BText.highlightMedium(barbershop.name),
                        BText.body(
                          barbershop.address,
                          emphasis: Emphasis.less,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BText.highlightSmall('Pilih layanan'),
          ),
          BCard(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Column(
              children: services
                  .map((e) => BListTile(
                        onTap: () {
                          final appointmentService = AppointmentService(
                            id: e.id,
                            name: e.name,
                            durationInMinutes: e.durationInMinutes,
                            price: e.price,
                          );
                          final selected = context
                              .read<BookingFormBloc>()
                              .state
                              .selectedServices
                              .contains(appointmentService);

                          if (selected) {
                            context
                                .read<BookingFormBloc>()
                                .add(BookingFormEvent.serviceUnselected(e));
                          } else {
                            context
                                .read<BookingFormBloc>()
                                .add(BookingFormEvent.serviceSelected(e));
                          }
                        },
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        title: BText.highlightSmall(e.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BText.body(
                              getIt<NumberFormat>().format(e.price),
                            ),
                            BText.caption(
                              parseDurationInMinutes(e.durationInMinutes),
                              emphasis: Emphasis.less,
                            ),
                          ],
                        ),
                        suffix: BlocSelector<BookingFormBloc, BookingFormState,
                            List<AppointmentService>>(
                          selector: (state) {
                            return state.selectedServices;
                          },
                          builder: (context, state) {
                            final appointmentService = AppointmentService(
                              id: e.id,
                              name: e.name,
                              durationInMinutes: e.durationInMinutes,
                              price: e.price,
                            );

                            return Checkbox(
                              checkColor: BColors.background,
                              value: state.contains(appointmentService),
                              onChanged: (selected) {
                                if (selected != null) {
                                  if (selected) {
                                    context.read<BookingFormBloc>().add(
                                        BookingFormEvent.serviceSelected(e));
                                  } else {
                                    context.read<BookingFormBloc>().add(
                                        BookingFormEvent.serviceUnselected(e));
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BText.highlightSmall('Pilih tanggal'),
          ),
          BCard(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  BlocSelector<BookingFormBloc, BookingFormState, int?>(
                    selector: (state) {
                      return state.selectedDateTimestamp;
                    },
                    builder: (context, state) {
                      if (state != null) {
                        final dateTime =
                            DateTime.fromMillisecondsSinceEpoch(state);
                        final dateString = DateFormat('EEE, d MMM y', 'id_ID')
                            .format(dateTime);
                        final timeString =
                            DateFormat.Hm('id_ID').format(dateTime);
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BText.titleSmall(dateString),
                              BText.body(timeString),
                            ],
                          ),
                        );
                      }
                      return Expanded(
                        child: BText.titleSmall('Belum memilih'),
                      );
                    },
                  ),
                  BButton(
                    onPressed: () async {
                      final bloc = context.read<BookingFormBloc>();

                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                      );

                      if (selectedDate == null) return;

                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (selectedTime == null) return;

                      final selectedDateTime = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );

                      bloc.add(BookingFormEvent.selectedDateTimestampChanged(
                          selectedDateTime.millisecondsSinceEpoch));
                    },
                    label: 'Pilih Tanggal',
                    dense: true,
                    size: BWidgetSize.small,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BText.highlightSmall('Detail Pembayaran'),
          ),
          BCard(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocSelector<BookingFormBloc, BookingFormState,
                  List<AppointmentService>>(
                selector: (state) {
                  return state.selectedServices;
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      ...state.map((e) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BText.body(e.name),
                              BText(
                                getIt<NumberFormat>().format(e.price),
                                style: captionStyle,
                              ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BText.body('Biaya penanganan'),
                          BText(
                            getIt<NumberFormat>()
                                .format(BusinessAmounts.appointmentFee),
                            style: captionStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BText.titleSmall('Total'),
                          BText(
                            getIt<NumberFormat>().format(context
                                .read<BookingFormBloc>()
                                .calculateTotal(state)),
                            style: captionStyle.copyWith(
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
