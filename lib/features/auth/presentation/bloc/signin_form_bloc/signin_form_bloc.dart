import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../exceptions/value_failure.dart';
import '../../../../../utils/value_validators.dart';
import '../../../domain/auth_failure.dart';
import '../../../domain/usecase/signin_with_email_and_password.dart';

part 'signin_form_bloc.freezed.dart';
part 'signin_form_event.dart';
part 'signin_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final SigninWithEmailAndPassword signinWithEmailAndPassword;

  SignInFormBloc(this.signinWithEmailAndPassword)
      : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      await event.when(
        emailChanged: (email) => _handleEmailChanged(emit, email),
        passwordChanged: (password) => _handlePasswordChanged(emit, password),
        signInButtonPressed: () => _handleSignInButtonPressed(emit),
      );
    });
  }

  Future<void> _handleEmailChanged(
      Emitter<SignInFormState> emit, String email) async {
    emit(state.copyWith(email: validateEmailAddress(email)));
  }

  Future<void> _handlePasswordChanged(
      Emitter<SignInFormState> emit, String password) async {
    emit(state.copyWith(password: validatePassword(password, 8)));
  }

  Future<void> _handleSignInButtonPressed(Emitter<SignInFormState> emit) async {
    final isEmailValid = state.email.isRight();
    final isPasswordValid = state.password.isRight();
    Either<AuthFailure, Unit>? failureOrSuccess;

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      final email = state.email.getOrElse((_) => '');
      final password = state.password.getOrElse((_) => '');

      failureOrSuccess = await signinWithEmailAndPassword(
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
