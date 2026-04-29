import 'package:fundoo/presentation/features/auth/auth_main/auth_main_page.dart';
import 'package:fundoo/presentation/features/auth/login/login_page.dart';
import 'package:fundoo/presentation/features/auth/signup/signup_page.dart';
import 'package:fundoo/presentation/features/into/view/intro.dart';
import 'package:fundoo/presentation/features/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashPage()),
    GoRoute(path: '/intro', builder: (context, state) => IntroPage()),

    GoRoute(path: '/auth', builder: (context, state) => AuthMainPage(), routes: [
      GoRoute(path: 'log-in', builder: (context, state) => LoginPage()),
      GoRoute(path: 'sign-up', builder: (context, state) => SignUpPage()),
    ]),
  ],
);
