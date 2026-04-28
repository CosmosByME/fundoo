import 'package:flutter/material.dart';
import 'package:fundoo/core/services/preferences_service.dart';
import 'package:fundoo/core/services/svg_service.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<int>(
          tween: Tween(begin: 150, end: 200),
          duration: Duration(milliseconds: 300),
          builder: (context, value, child) {
            return SvgService().logo(value.toDouble(), value.toDouble());
          },
          onEnd: () async {
            bool isSeen = await PreferencesService.getIntroSeen();

            if (isSeen) {
              if (context.mounted) {
                context.go("/home");
              }
            } else {
              if (context.mounted) {
                context.go("/intro");
              }
            }
          },
        ),
      ),
    );
  }
}
