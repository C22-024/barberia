import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/spacing.dart';
import '../../../../injection.dart';
import '../../domain/entities/appointment.dart';
import '../bloc/review_form/review_form_bloc.dart';

class AddReviewPage extends StatelessWidget {
  const AddReviewPage({
    super.key,
    required this.appointment,
  });

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReviewFormBloc>()
        ..add(ReviewFormEvent.initialized(
            appointment.id, appointment.barbershopId, appointment.user)),
      child: BlocListener<ReviewFormBloc, ReviewFormState>(
        listenWhen: (p, c) =>
            p.failureOrSuccessOption != c.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () => null,
            (failureOrSuccess) => failureOrSuccess.fold(
              (_) => FlushbarHelper.createError(
                      message: 'Yah, ulasanmu gagal terkirim nih.')
                  .show(context),
              (_) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  FlushbarHelper.createSuccess(
                          message: 'Yeay, ulasanmu terkirim!')
                      .show(context);
                });
                context.goNamed('activities');
              },
            ),
          );
        },
        child: Scaffold(
          appBar: BAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                BCard(
                  color: BColors.primary,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BText('Kasih rating ke barber, dong!',
                              style: titleMediumStyle.copyWith(
                                  color: BColors.onPrimary)),
                          BText('1 kecewa, 5 kece!',
                              style: titleSmallStyle.copyWith(
                                  color: BColors.onPrimary)),
                          Builder(builder: (context) {
                            return RatingBar.builder(
                              minRating: 1,
                              maxRating: 5,
                              itemCount: 5,
                              unratedColor: BColors.secondaryTextColor,
                              direction: Axis.horizontal,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star_rounded,
                                color: BColors.warning,
                              ),
                              onRatingUpdate: (rating) {
                                context
                                    .read<ReviewFormBloc>()
                                    .add(ReviewFormEvent.rateChanged(rating));
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                BCard(
                  color: BColors.primary,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 32,
                            child: Icon(Icons.person),
                          ),
                          horizontalSpace16,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BText(
                                appointment.barbershopName,
                                style: titleMediumStyle.copyWith(
                                    color: BColors.onPrimary),
                              ),
                              BText(
                                DateTime.fromMillisecondsSinceEpoch(
                                        appointment.timestamp)
                                    .toString(),
                                style: bodyStyle.copyWith(
                                    color: BColors.onPrimary),
                              ),
                              BText(appointment.id,
                                  style: bodyStyle.copyWith(
                                      color: BColors.onPrimary)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Builder(builder: (context) {
                          return BTextFormField(
                            filled: true,
                            hintText: 'Ceritakan detailnya di sini!',
                            maxLines: 5,
                            onChanged: (content) {
                              context
                                  .read<ReviewFormBloc>()
                                  .add(ReviewFormEvent.contentChanged(content));
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<ReviewFormBloc, ReviewFormState>(
              buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
              builder: (context, state) {
                return BButton(
                  label: 'Kirim',
                  busy: state.isSubmitting,
                  onPressed: () {
                    context
                        .read<ReviewFormBloc>()
                        .add(const ReviewFormEvent.submitButtonPressed());
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
