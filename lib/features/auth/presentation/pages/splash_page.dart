import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/barberia_icon_1024.png',
          width: 192,
          height: 192,
        ),
      ),
    );
  }
}
