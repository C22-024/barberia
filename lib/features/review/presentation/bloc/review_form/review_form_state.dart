part of 'review_form_bloc.dart';

@freezed
class ReviewFormState with _$ReviewFormState {
  const factory ReviewFormState({
    required String appointmentId,
    required String barbershopId,
    required Option<User> user,
    required double rate,
    required String content,
    required bool isSubmitting,
    required Option<Either<Failure, Unit>> failureOrSuccessOption,
  }) = _ReviewFormState;

  factory ReviewFormState.initial() => ReviewFormState(
        appointmentId: '',
        barbershopId: '',
        user: none(),
        rate: 0,
        content: '',
        isSubmitting: false,
        failureOrSuccessOption: none(),
      );
}
