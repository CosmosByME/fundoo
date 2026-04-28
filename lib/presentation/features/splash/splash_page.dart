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
      backgroundColor: Colors.white,
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 200, end: 250),
          duration: Duration(milliseconds: 400),
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
