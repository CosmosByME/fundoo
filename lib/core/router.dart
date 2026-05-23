import 'package:flutter/cupertino.dart';
import 'package:fundoo/presentation/auth/auth_main/auth_main_page.dart';
import 'package:fundoo/presentation/auth/login/login_page.dart';
import 'package:fundoo/presentation/auth/login/sms_verification.dart';
import 'package:fundoo/presentation/auth/signup/done_page.dart';
import 'package:fundoo/presentation/auth/signup/personal_info_page.dart';
import 'package:fundoo/presentation/auth/signup/signup_page.dart';
import 'package:fundoo/presentation/auth/signup/sms_verification.dart';
import 'package:fundoo/presentation/home/view/home.dart';
import 'package:fundoo/presentation/home/view/other/all_activities.dart';
import 'package:fundoo/presentation/home/view/other/bio.dart';
import 'package:fundoo/presentation/home/view/other/change_number_otp.dart';
import 'package:fundoo/presentation/home/view/other/faq_page.dart';
import 'package:fundoo/presentation/home/view/other/notifications.dart';
import 'package:fundoo/presentation/home/view/other/personal_info.dart';
import 'package:fundoo/presentation/home/view/other/phone_number.dart';
import 'package:fundoo/presentation/home/view/other/support_page.dart';
import 'package:fundoo/presentation/into/view/intro.dart';
import 'package:fundoo/presentation/set_goals/view/cost_of_goal.dart';
import 'package:fundoo/presentation/set_goals/view/current_budget_page.dart';
import 'package:fundoo/presentation/set_goals/view/goal_summary.dart';
import 'package:fundoo/presentation/set_goals/view/period_of_goal.dart';
import 'package:fundoo/presentation/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

import '../presentation/home/view/games.dart';
import '../presentation/home/view/main_page.dart';
import '../presentation/home/view/profile_page.dart';
import '../presentation/home/view/statistics.dart';
import '../presentation/set_goals/view/name_of_goal.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  // refreshListenable: authNotifier,
  // redirect: (context, state) {
  //   if (!authNotifier.isAuthenticated) {
  //     return '/auth';
  //   }
  //   return null;
  // },
  navigatorKey: rootNavigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashPage()),
    GoRoute(path: '/intro', builder: (context, state) => Intro()),

    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, child) {
        return HomePage(
          key: state.pageKey,
          currentIndex: switch (state.uri.path) {
            final p when p.startsWith('/main-page') => 0,
            final p when p.startsWith('/statistics') => 1,
            final p when p.startsWith('/games') => 2,
            final p when p.startsWith('/profile') => 3,
            _ => 0,
          },
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/main-page',
          name: 'main-page',
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: '/statistics',
          name: 'statistics',
          builder: (context, state) => const StatisticsPage(),
        ),
        GoRoute(
          path: '/games',
          name: 'games',
          builder: (context, state) => const GamesPage(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),

    GoRoute(
      path: '/auth',
      builder: (context, state) => AuthMainPage(),
      routes: [
        GoRoute(
          path: 'log-in',
          builder: (context, state) => LoginPage(),
          routes: [
            GoRoute(
              path: 'otp',
              builder: (context, state) {
                return SmsVerificationPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'sign-up',
          name: 'sign-up',
          builder: (context, state) => SignUpPage(),
          routes: [
            GoRoute(
              path: 'otp',
              builder: (context, state) {
                return SmsVerificationSignUpPage();
              },
              routes: [
                GoRoute(
                  path: 'personal-info',
                  name: 'personal-info',
                  builder: (context, state) => PersonalInfoPage(),
                  routes: [
                    GoRoute(
                      path: '/done-page',
                      builder: (context, state) => DonePage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/name-of-goal',
      builder: (context, state) => NameOfGoal(),
      routes: [
        GoRoute(
          path: 'cost-of-goal',
          name: 'cost-of-goal',
          builder: (context, state) => CostOfGoal(),
          routes: [
            GoRoute(
              path: 'current-budget',
              name: 'current-budget',
              builder: (context, state) => CurrentBudgetPage(),
              routes: [
                GoRoute(
                  path: 'period-of-goal',
                  name: 'period-of-goal',
                  builder: (context, state) => PeriodOfGoal(),
                  routes: [
                    GoRoute(
                      path: 'goal-summary',
                      name: 'goal-summary',
                      builder: (context, state) => GoalSummary(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/notifications',
      builder: (context, state) => NotificationsPage(),
    ),
    GoRoute(
      path: '/phone-changing',
      builder: (context, state) => PhoneChangingPage(),
    ),
    GoRoute(
      path: '/change-number-otp',
      builder: (context, state) => ChangeNumberOpt(),
    ),
    GoRoute(
      path: '/personal-info-changing',
      builder: (context, state) => PersonalInfo(),
    ),
    GoRoute(path: '/bio', builder: (context, state) => BioChangingPage()),
    GoRoute(path: '/faq', builder: (context, state) => const FaqPage()),
    GoRoute(path: '/support', builder: (context, state) => const SupportPage()),
    GoRoute(
      path: '/recent-activity',
      builder: (context, state) => AllActivities(),
    ),
  ],
);

//This notifier is just for redirecting. Not for external use.

class AuthNotifier extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void logOut() {
    _isAuthenticated = false;
    notifyListeners();
  }
}

final authNotifier = AuthNotifier();
