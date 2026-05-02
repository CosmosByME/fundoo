import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n_inherited.dart';
import 'package:fundoo/core/l10n/outputs/app_localizations.dart';
import 'package:fundoo/core/router.dart';
import 'package:fundoo/presentation/features/into/notifier/inherited_intro.dart';
import 'package:fundoo/presentation/features/into/notifier/intro_notifier.dart';
import 'package:fundoo/presentation/features/set_goals/module/goal_notifier.dart';
import 'package:fundoo/presentation/features/set_goals/module/inherited_goal.dart';

void main() {
  runApp(
    L10nInherited(
      locale: ValueNotifier(Locale('uz')),
      child: InheritedIntro(
        notifier: IntroNotifier(),
        child: InheritedGoal(goalNotifier: GoalNotifier(), child: MyApp()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.locale,
      builder: (context, value, child) {
        return MaterialApp.router(
          locale: context.locale.value,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routerConfig: router,
        );
      },
    );
  }
}
