import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

import 'routing.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Barberia',
      debugShowCheckedModeBanner: false,
      theme: createBarberiaMaterialTheme(),
      routerConfig: router,
    );
  }
}
