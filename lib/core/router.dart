import 'package:fundoo/presentation/features/into/view/intro.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/'),
    GoRoute(path: '/intro', builder: (context, state) => IntroPage()),
  ],
);
