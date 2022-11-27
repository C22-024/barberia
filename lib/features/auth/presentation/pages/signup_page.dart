import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_widgets/spacing.dart';
import '../../../../constants/auth_failure_messages.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/signup_form_bloc/signup_form_bloc.dart';
import '../widgets/email_form_field.dart';
import '../widgets/password_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpFormBloc>(),
      child: BlocConsumer<SignUpFormBloc, SignUpFormState>(
        listenWhen: (previous, current) =>
            previous.authFailureOrSuccessOption !=
            current.authFailureOrSuccessOption,
        listener: (context, state) {
          final errorMessage = state.authFailureOrSuccessOption.fold(
            () => null,
            (failureOrSuccess) => failureOrSuccess.fold(
              (failure) => failure.maybeWhen(
                emailAlreadyInUse: () => AuthFailureMessages.emailAlreadyInUse,
                weakPassword: () => AuthFailureMessages.weakPassword,
                invalidEmail: () => AuthFailureMessages.invalidEmail,
                timeout: () => AuthFailureMessages.timeout,
                orElse: () => AuthFailureMessages.unexpected,
              ),
              (_) {
                context
                    .read<AuthBloc>()
                    .add(const AuthEvent.authCheckRequested());
                return null;
              },
            ),
          );

          if (errorMessage != null) {
            FlushbarHelper.createError(message: errorMessage).show(context);
          }
        },
        buildWhen: (previous, current) =>
            previous.errorMessagesShown != current.errorMessagesShown,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: BAppBar.defaultWithBackButton(context, 'Buat Akun Baru'),
              body: _SignUpPageBody(state.errorMessagesShown),
              bottomSheet: Hero(
                tag: 'button0',
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BButton(
                    label: 'Buat Akun',
                    onPressed: () => context
                        .read<SignUpFormBloc>()
                        .add(const SignUpFormEvent.signUpButtonPressed()),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SignUpPageBody extends StatelessWidget {
  const _SignUpPageBody(this.errorMessagesShown);

  final bool errorMessagesShown;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: errorMessagesShown
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Hero(
              tag: 'display-text',
              child: Material(
                type: MaterialType.transparency,
                child: BText.display(
                  'Daftar sekarang dan rasakan kemudahannya!',
                  maxLines: 8,
                ),
              ),
            ),
            verticalSpace16,
            EmailFormField(
              onChanged: (email) => context
                  .read<SignUpFormBloc>()
                  .add(SignUpFormEvent.emailChanged(email)),
              validator: (_) {
                return context.read<SignUpFormBloc>().state.email.fold(
                      (failure) => failure.message,
                      (_) => null,
                    );
              },
            ),
            verticalSpace8,
            PasswordFormField(
              hintText: 'Kata Sandi',
              onChanged: (password) => context
                  .read<SignUpFormBloc>()
                  .add(SignUpFormEvent.passwordChanged(password)),
              validator: (_) {
                return context.read<SignUpFormBloc>().state.password.fold(
                      (failure) => failure.message,
                      (_) => null,
                    );
              },
            ),
            verticalSpace8,
            PasswordFormField(
              hintText: 'Konfirmasi Kata Sandi',
              onChanged: (confirmationPassword) => context
                  .read<SignUpFormBloc>()
                  .add(SignUpFormEvent.confirmationPasswordChanged(
                    confirmationPassword,
                  )),
              validator: (_) {
                return context
                        .read<SignUpFormBloc>()
                        .state
                        .isConfirmationPasswordValid
                    ? null
                    : 'Kata sandi tidak cocok.';
              },
            ),
          ],
        ),
      ),
    );
  }
}
