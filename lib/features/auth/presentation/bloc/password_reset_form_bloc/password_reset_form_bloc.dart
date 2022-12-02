import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/value_failure.dart';
import '../../../../../utils/value_validators.dart';
import '../../../domain/auth_failure.dart';
import '../../../domain/usecase/send_password_reset_email.dart';

part 'password_reset_form_bloc.freezed.dart';
part 'password_reset_form_event.dart';
part 'password_reset_form_state.dart';

class PasswordResetFormBloc
    extends Bloc<PasswordResetFormEvent, PasswordResetFormState> {
  final SendPasswordResetEmail _sendPasswordResetEmail;

  PasswordResetFormBloc(this._sendPasswordResetEmail)
      : super(PasswordResetFormState.initial()) {
    on<PasswordResetFormEvent>((event, emit) async {
      await event.when(
        emailChanged: (email) => _handleEmailChanged(emit, email),
        submitButtonPressed: () => _handleSubmitButtonPressed(emit),
      );
    });
  }

  Future<void> _handleEmailChanged(
    Emitter<PasswordResetFormState> emit,
    String email,
  ) async {
    emit(state.copyWith(email: validateEmailAddress(email)));
  }

  Future<void> _handleSubmitButtonPressed(
      Emitter<PasswordResetFormState> emit) async {
    final isEmailValid = state.email.isRight();
    Either<AuthFailure, Unit>? failureOrSuccess;

    if (isEmailValid) {
      emit(state.copyWith(
        isSubmitting: true,
        sendEmailFailureOrSuccessOption: none(),
      ));

      final email = state.email.getOrElse((_) => '');

      failureOrSuccess = await _sendPasswordResetEmail(email);
    }

    emit(state.copyWith(
      isSubmitting: false,
      errorMessagesShown: true,
      sendEmailFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
