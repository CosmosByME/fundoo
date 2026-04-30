import 'package:fundoo/presentation/features/auth/auth_main/auth_main_page.dart';
import 'package:fundoo/presentation/features/auth/login/login_page.dart';
import 'package:fundoo/presentation/features/auth/login/sms_verification.dart';
import 'package:fundoo/presentation/features/auth/signup/done_page.dart';
import 'package:fundoo/presentation/features/auth/signup/personal_info_page.dart';
import 'package:fundoo/presentation/features/auth/signup/signup_page.dart';
import 'package:fundoo/presentation/features/auth/signup/sms_verification.dart';
import 'package:fundoo/presentation/features/into/view/intro.dart';
import 'package:fundoo/presentation/features/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashPage()),
    GoRoute(path: '/intro', builder: (context, state) => IntroPage()),

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

    GoRoute(
      path: '/done-page',
      builder: (context, state) => DonePage(),
    )
  ],
);
