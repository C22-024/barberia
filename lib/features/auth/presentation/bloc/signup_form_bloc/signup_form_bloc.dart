import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/value_failure.dart';
import '../../../../../utils/value_validators.dart';
import '../../../domain/auth_failure.dart';
import '../../../domain/usecase/create_user_with_email_and_password.dart';

part 'signup_form_bloc.freezed.dart';
part 'signup_form_event.dart';
part 'signup_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final CreateUserWithEmailAndPassword createUserWithEmailAndPassword;

  SignUpFormBloc(this.createUserWithEmailAndPassword)
      : super(SignUpFormState.initial()) {
    on<SignUpFormEvent>((event, emit) async {
      await event.when(
        emailChanged: (email) => _handleEmailChanged(emit, email),
        passwordChanged: (password) => _handlePasswordChanged(emit, password),
        confirmationPasswordChanged: (confirmationPassword) =>
            _handleConfirmationPasswordChange(emit, confirmationPassword),
        signUpButtonPressed: () => _handleSignUpButtonPressed(emit),
      );
    });
  }

  Future<void> _handleEmailChanged(
    Emitter<SignUpFormState> emit,
    String email,
  ) async {
    emit(state.copyWith(email: validateEmailAddress(email)));
  }

  Future<void> _handlePasswordChanged(
    Emitter<SignUpFormState> emit,
    String password,
  ) async {
    final isConfirmationPasswordValid = state.confirmationPassword == password;
    emit(state.copyWith(
      password: validatePassword(password, 8),
      isConfirmationPasswordValid: isConfirmationPasswordValid,
    ));
  }

  Future<void> _handleConfirmationPasswordChange(
    Emitter<SignUpFormState> emit,
    String confirmationPassword,
  ) async {
    final password = state.password.fold(
      (failure) => failure.value,
      (value) => value,
    );
    final isConfirmationPasswordValid = confirmationPassword == password;
    emit(state.copyWith(
      confirmationPassword: confirmationPassword,
      isConfirmationPasswordValid: isConfirmationPasswordValid,
    ));
  }

  Future<void> _handleSignUpButtonPressed(Emitter<SignUpFormState> emit) async {
    final isEmailValid = state.email.isRight();
    final isPasswordValid = state.password.isRight();
    Either<AuthFailure, Unit>? failureOrSuccess;

    if (isEmailValid && isPasswordValid && state.isConfirmationPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      final email = state.email.getOrElse((_) => '');
      final password = state.password.getOrElse((_) => '');

      failureOrSuccess = await createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      errorMessagesShown: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
