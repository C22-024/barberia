import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/value_validators.dart';
import '../../../domain/auth_failure.dart';
import '../../../domain/usecase/signin_with_email_and_password.dart';

part 'signin_form_bloc.freezed.dart';
part 'signin_form_event.dart';
part 'signin_form_state.dart';

class SigninFormBloc extends Bloc<SigninFormEvent, SigninFormState> {
  final SigninWithEmailAndPassword signinWithEmailAndPassword;

  SigninFormBloc(this.signinWithEmailAndPassword)
      : super(SigninFormState.initial()) {
    on<SigninFormEvent>((event, emit) {
      event.when(
        emailChanged: (email) => _handleEmailChanged(emit, email),
        passwordChanged: (password) => _handlePasswordChanged(emit, password),
        signInButtonPressed: () => _handleSignInButtonPressed(emit),
      );
    });
  }

  void _handleEmailChanged(Emitter<SigninFormState> emit, String email) {
    emit(state.copyWith(
      email: validateEmailAddress(email),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _handlePasswordChanged(Emitter<SigninFormState> emit, String password) {
    emit(state.copyWith(
      email: validatePassword(password, 8),
      authFailureOrSuccessOption: none(),
    ));
  }

  Future<void> _handleSignInButtonPressed(Emitter<SigninFormState> emit) async {
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

      emit(state.copyWith(
        isSubmitting: false,
        errorMessagesShown: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    }
  }
}
