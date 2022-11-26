import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
      event.when(
        emailChanged: (email) => _handleEmailChanged(emit, email),
        passwordChanged: (password) => _handlePasswordChanged(emit, password),
        signUpButtonPressed: () => _handleSignUpButtonPressed(emit),
      );
    });
  }

  void _handleEmailChanged(Emitter<SignUpFormState> emit, String email) {
    emit(state.copyWith(
      email: validateEmailAddress(email),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _handlePasswordChanged(Emitter<SignUpFormState> emit, String password) {
    emit(state.copyWith(
      email: validatePassword(password, 8),
      authFailureOrSuccessOption: none(),
    ));
  }

  Future<void> _handleSignUpButtonPressed(Emitter<SignUpFormState> emit) async {
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
