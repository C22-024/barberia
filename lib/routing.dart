import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'common_widgets/placeholder_page.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/auth/presentation/pages/welcome_page.dart';
import 'injection.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNav');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellNav');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashPage(),
      ),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => const PlaceholderPage('Home Page'),
      routes: [
        GoRoute(
          name: 'home',
          path: '/home',
          builder: (context, state) => const PlaceholderPage('Home'),
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'welcome',
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
      routes: [
        GoRoute(
          name: 'signin',
          path: 'signin',
          builder: (context, state) => const PlaceholderPage('Sign In'),
          routes: [
            GoRoute(
              name: 'reset-password',
              path: 'reset-password',
              builder: (context, state) =>
                  const PlaceholderPage('Reset Password'),
            ),
          ],
        ),
        GoRoute(
          name: 'signup',
          path: 'signup',
          builder: (context, state) => const PlaceholderPage('Sign Up'),
        ),
      ],
    ),
  ],
  redirect: (_, state) async {
    return await getIt<AuthBloc>().state.when(
          authenticated: (_) async {
            // from welcome page
            if (state.subloc.startsWith('/welcome')) {
              return '/home';
            }

            // from splash screen
            if (state.subloc == '/') {
              return await Future.delayed(
                const Duration(seconds: 2),
                () => '/home',
              );
            }

            // no redirect
            return null;
          },
          unauthenticated: () async {
            // from splash screen
            if (state.subloc == '/') {
              return await Future.delayed(
                const Duration(seconds: 2),
                () => '/welcome',
              );
            }

            // neither in splash nor welcome
            if (!state.subloc.startsWith('/welcome')) {
              return '/welcome';
            }

            // no redirect
            return null;
          },
          initial: () => null,
        );
  },
  refreshListenable: _RefreshStream(getIt<AuthBloc>().stream),
);

class _RefreshStream extends ChangeNotifier {
  _RefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
