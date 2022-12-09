import 'package:barberia/features/review/domain/entities/review.dart';
import 'package:barberia/features/review/domain/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/failure.dart';
import '../../../domain/usecases/add_review.dart';

part 'review_form_event.dart';
part 'review_form_state.dart';
part 'review_form_bloc.freezed.dart';

class ReviewFormBloc extends Bloc<ReviewFormEvent, ReviewFormState> {
  final AddReview _addReview;

  ReviewFormBloc(this._addReview) : super(ReviewFormState.initial()) {
    on<ReviewFormEvent>((event, emit) async {
      await event.when(
        initialized: (appointmentId, barbershopId, user) =>
            _handleInitialized(emit, appointmentId, barbershopId, user),
        rateChanged: (rate) => _handleRateChanged(emit, rate),
        contentChanged: (content) => _handleContentChanged(emit, content),
        submitButtonPressed: () => _handleSubmitButtonPressed(emit),
      );
    });
  }

  Future<void> _handleInitialized(
    Emitter<ReviewFormState> emit,
    String appointmentId,
    String barbershopId,
    User user,
  ) async {
    emit(state.copyWith(
      appointmentId: appointmentId,
      barbershopId: barbershopId,
      user: optionOf(user),
    ));
  }

  Future<void> _handleRateChanged(
    Emitter<ReviewFormState> emit,
    double rate,
  ) async {
    emit(state.copyWith(
      rate: rate,
    ));
  }

  Future<void> _handleContentChanged(
    Emitter<ReviewFormState> emit,
    String content,
  ) async {
    emit(state.copyWith(
      content: content,
    ));
  }

  Future<void> _handleSubmitButtonPressed(
    Emitter<ReviewFormState> emit,
  ) async {
    emit(state.copyWith(
      isSubmitting: true,
      failureOrSuccessOption: none(),
    ));

    final review = Review(
      appointmentId: state.appointmentId,
      barbershopId: state.barbershopId,
      content: state.content,
      rate: state.rate,
      user: state.user.toNullable()!,
    );

    final result = await _addReview(review);

    emit(state.copyWith(
      isSubmitting: false,
      failureOrSuccessOption: optionOf(result),
    ));
  }
}
