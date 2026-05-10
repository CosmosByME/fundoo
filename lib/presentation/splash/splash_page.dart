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
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 200, end: 250),
          duration: Duration(milliseconds: 400),
          builder: (context, value, child) {
            return SvgService().logo(value.toDouble(), value.toDouble());
          },
          onEnd: () async {
            bool isSeen = await PreferencesService.getIntroSeen();
            String isRegistered = await PreferencesService.getAccessToken();

            debugPrint(isRegistered);

            if (isSeen) {
              if (isRegistered.isNotEmpty) {
                if (context.mounted) {
                  context.go("/main-page");
                }
              } else {
                if (context.mounted) {
                  context.go("/auth");
                }
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
