import 'package:flutter/cupertino.dart';
import 'package:fundoo/presentation/features/auth/auth_main/auth_main_page.dart';
import 'package:fundoo/presentation/features/auth/login/login_page.dart';
import 'package:fundoo/presentation/features/auth/login/sms_verification.dart';
import 'package:fundoo/presentation/features/auth/signup/done_page.dart';
import 'package:fundoo/presentation/features/auth/signup/personal_info_page.dart';
import 'package:fundoo/presentation/features/auth/signup/signup_page.dart';
import 'package:fundoo/presentation/features/auth/signup/sms_verification.dart';
import 'package:fundoo/presentation/features/home/view/home.dart';
import 'package:fundoo/presentation/features/home/view/other/all_activities.dart';
import 'package:fundoo/presentation/features/home/view/other/bio.dart';
import 'package:fundoo/presentation/features/home/view/other/notifications.dart';
import 'package:fundoo/presentation/features/home/view/other/personal_info.dart';
import 'package:fundoo/presentation/features/home/view/other/phone_number.dart';
import 'package:fundoo/presentation/features/into/view/intro.dart';
import 'package:fundoo/presentation/features/set_goals/view/cost_of_goal.dart';
import 'package:fundoo/presentation/features/set_goals/view/current_budget_page.dart';
import 'package:fundoo/presentation/features/set_goals/view/goal_summary.dart';
import 'package:fundoo/presentation/features/set_goals/view/period_of_goal.dart';
import 'package:fundoo/presentation/features/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

import '../presentation/features/home/view/games.dart';
import '../presentation/features/home/view/main_page.dart';
import '../presentation/features/home/view/profile_page.dart';
import '../presentation/features/home/view/statistics.dart';
import '../presentation/features/set_goals/view/name_of_goal.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashPage()),
    GoRoute(path: '/intro', builder: (context, state) => Intro()),

    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      parentNavigatorKey: _rootNavigatorKey,
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
        GoRoute(path: '/main-page',name: 'main-page', builder: (context, state) => const MainPage()),
        GoRoute(path: '/statistics',name: 'statistics', builder: (context, state) => const StatisticsPage()),
        GoRoute(path: '/games',name: 'games', builder: (context, state) => const GamesPage  ()),
        GoRoute(path: '/profile',name: 'profile', builder: (context, state) => const ProfilePage()),
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
              path: 'otp/:number',
              builder: (context, state) {
                final id = state.pathParameters['number'] ?? '';
                return SmsVerificationPage(phoneNumber: id);
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
              path: 'otp/:number',
              builder: (context, state) {
                final id = state.pathParameters['number'] ?? '';
                return SmsVerificationSignUpPage(phoneNumber: id);
              },
              routes: [
                GoRoute(
                  path: 'personal-info',
                  name: 'personal-info',
                  builder: (context, state) => PersonalInfoPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    GoRoute(path: '/done-page', builder: (context, state) => DonePage()),

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


    GoRoute(path: '/notifications', builder: (context, state) => NotificationsPage()),
    GoRoute(path: '/phone-changing', builder: (context, state) => PhoneChangingPage()),
    GoRoute(path: '/personal-info-changing', builder: (context, state) => PersonalInfo()),
    GoRoute(path: '/bio', builder: (context, state) => BioChangingPage()),
    GoRoute(path: '/recent-activity', builder: (context, state) => AllActivities()),
  ],
);
