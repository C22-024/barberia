import 'package:another_flushbar/flushbar_helper.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/spacing.dart';
import '../../../../constants/auth_failure_messages.dart';
import '../../../../injection.dart';
import '../bloc/password_reset_form_bloc/password_reset_form_bloc.dart';
import '../widgets/email_form_field.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PasswordResetFormBloc>(),
      child: BlocConsumer<PasswordResetFormBloc, PasswordResetFormState>(
        listenWhen: (previous, current) =>
            previous.sendEmailFailureOrSuccessOption !=
            current.sendEmailFailureOrSuccessOption,
        listener: (context, state) {
          state.sendEmailFailureOrSuccessOption.fold(
            () => null,
            (failureOrSuccess) => failureOrSuccess.fold(
              (failure) {
                final errorMessage = failure.maybeWhen(
                  invalidEmail: () => AuthFailureMessages.invalidEmail,
                  timeout: () => AuthFailureMessages.timeout,
                  orElse: () => AuthFailureMessages.unexpected,
                );
                FlushbarHelper.createError(message: errorMessage).show(context);
              },
              (_) {
                context.pop();
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  FlushbarHelper.createSuccess(
                    message: 'Yeay, linknya berhasil dikirim ke email kamu ya!',
                  ).show(context);
                });
              },
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.errorMessagesShown != current.errorMessagesShown,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: BAppBar.defaultWithBackButton(context, 'Lupa Kata Sandi'),
              body: const _PasswordResetPageBody(),
              bottomSheet: Hero(
                tag: 'button1',
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BButton(
                    label: 'Kirim',
                    onPressed: () => context.read<PasswordResetFormBloc>().add(
                        const PasswordResetFormEvent.submitButtonPressed()),
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

class _PasswordResetPageBody extends StatelessWidget {
  const _PasswordResetPageBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BText.display('Lupa sandi?'),
          BText.body(
            'Masukkan email untuk mendapatkan link reset password.',
            maxLines: 2,
            emphasis: Emphasis.less,
          ),
          verticalSpace16,
          BlocBuilder<PasswordResetFormBloc, PasswordResetFormState>(
            buildWhen: (previous, current) =>
                previous.errorMessagesShown != current.errorMessagesShown,
            builder: (context, state) {
              return EmailFormField(
                autovalidateMode: state.errorMessagesShown
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (email) => context
                    .read<PasswordResetFormBloc>()
                    .add(PasswordResetFormEvent.emailChanged(email)),
                validator: (_) {
                  return context.read<PasswordResetFormBloc>().state.email.fold(
                        (failure) => failure.message,
                        (_) => null,
                      );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
