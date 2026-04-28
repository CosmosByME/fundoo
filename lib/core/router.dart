import 'package:fundoo/presentation/features/into/view/intro.dart';
import 'package:fundoo/presentation/features/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashPage()),
    GoRoute(path: '/intro', builder: (context, state) => IntroPage()),
  ],
);
