import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/spacing.dart';
import '../../../../constants/auth_failure_messages.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/signin_form_bloc/signin_form_bloc.dart';
import '../widgets/email_form_field.dart';
import '../widgets/password_form_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInFormBloc>(),
      child: BlocConsumer<SignInFormBloc, SignInFormState>(
        listenWhen: (previous, current) =>
            previous.authFailureOrSuccessOption !=
            current.authFailureOrSuccessOption,
        listener: (context, state) {
          final errorMessage = state.authFailureOrSuccessOption.fold(
            () => null,
            (failureOrSuccess) => failureOrSuccess.fold(
              (failure) => failure.maybeWhen(
                invalidEmailOrPassword: () =>
                    AuthFailureMessages.invalidEmailOrPassword,
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
              appBar: BAppBar.defaultWithBackButton(context, 'Masuk'),
              body: _SignInPageBody(state.errorMessagesShown),
              bottomSheet: BlocBuilder<SignInFormBloc, SignInFormState>(
                buildWhen: (previous, current) =>
                    previous.isSubmitting != current.isSubmitting,
                builder: (context, state) {
                  return Hero(
                    tag: 'button1',
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: BButton(
                        label: 'Masuk',
                        busy: state.isSubmitting,
                        onPressed: () => context
                            .read<SignInFormBloc>()
                            .add(const SignInFormEvent.signInButtonPressed()),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SignInPageBody extends StatelessWidget {
  const _SignInPageBody(this.errorMessagesShown);

  final bool errorMessagesShown;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: errorMessagesShown
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Hero(
              tag: 'display-text',
              child: Material(
                type: MaterialType.transparency,
                child: BText.display(
                  'Welcome back!',
                  maxLines: 2,
                ),
              ),
            ),
            verticalSpace16,
            EmailFormField(
              textInputAction: TextInputAction.next,
              onChanged: (email) => context
                  .read<SignInFormBloc>()
                  .add(SignInFormEvent.emailChanged(email)),
              validator: (_) {
                return context.read<SignInFormBloc>().state.email.fold(
                      (failure) => failure.message,
                      (_) => null,
                    );
              },
            ),
            verticalSpace8,
            PasswordFormField(
              hintText: 'Kata sandi',
              textInputAction: TextInputAction.done,
              onChanged: (password) => context
                  .read<SignInFormBloc>()
                  .add(SignInFormEvent.passwordChanged(password)),
              validator: (_) {
                return context.read<SignInFormBloc>().state.password.fold(
                      (failure) => failure.message,
                      (_) => null,
                    );
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: BButton(
                label: 'Lupa kata sandi?',
                variant: BButtonVariant.bare,
                dense: true,
                size: BWidgetSize.mini,
                onPressed: () => context.pushNamed('password-reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
