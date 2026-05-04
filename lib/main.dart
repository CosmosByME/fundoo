import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n_inherited.dart';
import 'package:fundoo/core/l10n/outputs/app_localizations.dart';
import 'package:fundoo/core/router.dart';
import 'package:fundoo/core/services/preferences_service.dart';
import 'package:fundoo/core/theme/inherited_theme.dart';
import 'package:fundoo/core/theme/themes.dart';
import 'package:fundoo/presentation/features/into/notifier/inherited_intro.dart';
import 'package:fundoo/presentation/features/into/notifier/intro_notifier.dart';
import 'package:fundoo/presentation/features/set_goals/module/goal_notifier.dart';
import 'package:fundoo/presentation/features/set_goals/module/inherited_goal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDarkMode = await PreferencesService.getDarkMode();
  final themeMode = isDarkMode == null
      ? ThemeMode.system
      : (isDarkMode ? ThemeMode.dark : ThemeMode.light);

  final localeName = await PreferencesService.getLocale();
  final Locale locale;
  if (localeName != null) {
    locale = Locale(localeName);
  } else {
    locale = Locale('uz');
  }

  

  runApp(
    L10nInherited(
      locale: ValueNotifier(locale),
      child: InheritedIntro(
        notifier: IntroNotifier(),
        child: InheritedGoal(
          goalNotifier: GoalNotifier(),
          child: InheritedThemeMode(
            themeMode: ValueNotifier(themeMode),
            child: MyApp(),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.themeMode,
      builder: (context, themeMode, child) {
        return ValueListenableBuilder(
          valueListenable: context.locale,
          builder: (context, value, child) {
            return MaterialApp.router(
              theme: MyAppThemes().lightTheme,
              darkTheme: MyAppThemes().darkTheme,
              themeMode: themeMode,
              locale: context.locale.value,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              routerConfig: router,
            );
          },
        );
      },
    );
  }
}
