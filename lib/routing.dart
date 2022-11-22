import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:barberia/features/activities/presentation/activities_page.dart';

import 'common_widgets/placeholder_page.dart';
import 'common_widgets/scaffold_with_navbar.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/password_reset_page.dart';
import 'features/auth/presentation/pages/profile_setup_page.dart';
import 'features/auth/presentation/pages/signin_page.dart';
import 'features/auth/presentation/pages/signup_page.dart';
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
      builder: (context, state, child) => ScaffoldWithNavBar(child: child),
      routes: [
        GoRoute(
          name: 'home',
          path: '/home',
          builder: (context, state) => const PlaceholderPage('Home'),
        ),
        GoRoute(
          name: 'activities',
          path: '/activities',
          builder: (context, state) => const ActivitiesPage(),
        ),
        GoRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, state) => const PlaceholderPage('Profile'),
        ),
      ],
    ),
    GoRoute(
      name: 'profile-setup',
      path: '/profile-setup',
      builder: (context, state) => const ProfileSetupPage(),
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
          builder: (context, state) => const SignInPage(),
          routes: [
            GoRoute(
              name: 'password-reset',
              path: 'password-reset',
              builder: (context, state) => const PasswordResetPage(),
            ),
          ],
        ),
        GoRoute(
          name: 'signup',
          path: 'signup',
          builder: (context, state) => const SignUpPage(),
        ),
      ],
    ),
  ],
  redirect: (_, state) async {
    return await getIt<AuthBloc>().state.when(
          authenticated: (user) async {
            late final String redirectPath;

            if (user.name == null) {
              redirectPath = '/profile-setup';
            } else {
              redirectPath = '/home';
            }

            // in a setup pages
            if (state.subloc == '/' ||
                state.subloc.startsWith('/welcome') ||
                state.subloc == '/profile-setup') {
              return redirectPath;
            }

            // from splash screen
            if (state.subloc == '/') {
              return await Future.delayed(
                const Duration(seconds: 2),
                () => redirectPath,
              );
            }

            // no redirect
            return null;
          },
          unauthenticated: (_) async {
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
