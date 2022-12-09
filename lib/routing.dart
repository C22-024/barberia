import 'dart:async';

import 'package:barberia/common_widgets/placeholder_page.dart';
import 'package:barberia/features/review/domain/entities/appointment.dart';
import 'package:barberia/features/booking/presentation/pages/booking_page.dart';
import 'package:barberia/features/booking/presentation/pages/success_page.dart';
import 'package:barberia/features/activities/domain/entities/appointment.dart';
import 'package:barberia/features/activities/presentation/pages/activities_page.dart';
import 'package:barberia/features/activities/presentation/pages/detail_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/review/domain/entities/user.dart';
import 'features/review/presentation/pages/add_review_page.dart';
import 'common_widgets/scaffold_with_navbar.dart';
import 'features/activities/presentation/pages/detail_history_page.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/password_reset_page.dart';
import 'features/auth/presentation/pages/profile_setup_page.dart';
import 'features/auth/presentation/pages/signin_page.dart';
import 'features/auth/presentation/pages/signup_page.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/auth/presentation/pages/welcome_page.dart';
import 'features/profile/presentation/pages/edit_profile_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'features/barbershop/presentation/pages/barbershop_page.dart';
import 'features/home/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/home/presentation/pages/location_settings_page.dart';
import 'features/home/presentation/pages/nearest_barbershops_overview_page.dart';
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
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              name: 'location-settings',
              path: 'location-settings',
              pageBuilder: (context, state) => const MaterialPage(
                fullscreenDialog: true,
                child: LocationSettingsPage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              name: 'search',
              path: 'search',
              pageBuilder: (context, state) => const MaterialPage(
                fullscreenDialog: true,
                child: PlaceholderPage('Search'),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              name: 'nearest-barbershops',
              path: 'nearest-barbershops',
              builder: (context, state) => NearestBarbershopsOverviewPage(
                homePageBloc: state.extra as HomePageBloc,
              ),
            ),
          ],
        ),
        GoRoute(
          name: 'activities',
          path: '/activities',
          builder: (context, state) => const ActivitiesPage(),
          routes: [
            GoRoute(
              name: 'detail-process-activity',
              path: 'detail-process-activity',
              builder: ((context, state) => DetailProgressPage(
                    appointment: state.extra as Appointment,
                  )),
            ),
            GoRoute(
              name: 'detail-history-activity',
              path: 'detail-history-activity',
              builder: ((context, state) => DetailHistoryPage(
                    appointment: state.extra as Appointment,
                  )),
            )
          ],
        ),
        GoRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              name: 'change-password',
              path: 'change-password',
              builder: (context, state) => const PasswordResetPage(),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              name: 'edit-profile',
              path: 'edit-profile',
              builder: (context, state) => const EditProfilePage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: 'add-review',
      path: '/add-review',
      pageBuilder: (context, state) {
        // return MaterialPage(
        //   child: AddReviewPage(
        //     appointment: state.extra as Appointment,
        //   ),
        //   fullscreenDialog: true,
        // );
        return const MaterialPage(
          child: AddReviewPage(
            appointment: Appointment(
              id: 'b6Is8jvH2hAI26ZrWQj7',
              barbershopId: 'barbershop_eu4SX8BFpONUt5TsHr8U',
              barbershopName: 'Cepmek BB',
              user:
                  User(id: 'user_vMnxi6RSdXUMkzUkiaRlRgQIe2K2', name: 'Zafran'),
              timestamp: 1670431166271,
            ),
          ),
          fullscreenDialog: true,
        );
      },
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
        ),
        GoRoute(
          name: 'signup',
          path: 'signup',
          builder: (context, state) => const SignUpPage(),
          routes: [
            GoRoute(
              name: 'password-reset',
              path: 'password-reset',
              builder: (context, state) => const PasswordResetPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'barbershops',
      path: '/barbershops/:id',
      builder: (context, state) =>
          BarbershopPage(barbershopId: '${state.params['id']}'),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'booking',
      path: '/booking/:barbershopId',
      builder: (context, state) =>
          BookingPage(barbershopId: '${state.params['barbershopId']}'),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'success',
      path: '/success',
      builder: (context, state) => const SuccessPage(),
    ),
  ],
  redirect: (_, state) async {
    return await getIt<AuthBloc>().state.when(
          authenticated: (user) async {
            late final String redirectPath;

            if (user.name == null) {
              redirectPath = '/profile-setup';
            } else {
              if (user.lastLocation == null) {
                redirectPath = '/home/location-settings';
              } else {
                redirectPath = '/home';
              }
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
