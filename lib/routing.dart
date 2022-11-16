import 'package:go_router/go_router.dart';

import 'common_widgets/placeholder_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PlaceholderPage('Root'),
    ),
  ],
);
