import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/spacing.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: const [
          _Background(),
          _Foreground(),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            BColors.neutral1000,
            BColors.transparent,
          ],
        ),
      ),
      position: DecorationPosition.foreground,
      child: Image.asset(
        'assets/images/welcome_background.png',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Foreground extends StatelessWidget {
  const _Foreground();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          _DisplayTextSection(),
          _ButtonSection(),
        ],
      ),
    );
  }
}

class _DisplayTextSection extends StatelessWidget {
  const _DisplayTextSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Hero(
          tag: 'display-text',
          child: Material(
            type: MaterialType.transparency,
            child: BText.display(
              'Temukan Barbershop terbaik di sekitarmu',
              maxLines: 4,
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: 'button0',
          child: BButton(
            label: 'Buat Akun Baru',
            onPressed: () => context.pushNamed('signup'),
          ),
        ),
        verticalSpace8,
        Hero(
          tag: 'button1',
          child: BButton(
            label: 'Masuk',
            variant: BButtonVariant.outlined,
            onPressed: () => context.pushNamed('signin'),
          ),
        ),
      ],
    );
  }
}
