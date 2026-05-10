import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fundoo/core/l10n/l10n_inherited.dart';
import 'package:fundoo/core/l10n/outputs/app_localizations.dart';
import 'package:fundoo/core/router.dart';
import 'package:fundoo/core/services/preferences_service.dart';
import 'package:fundoo/core/theme/inherited_theme.dart';
import 'package:fundoo/core/theme/themes.dart';
import 'package:fundoo/core/widget/on_un_focus.dart';
import 'package:fundoo/presentation/auth/login/bloc/log_in_bloc.dart';
import 'package:fundoo/presentation/auth/signup/bloc/sign_up_bloc.dart';
import 'package:fundoo/presentation/into/notifier/inherited_intro.dart';
import 'package:fundoo/presentation/into/notifier/intro_notifier.dart';
import 'package:fundoo/presentation/set_goals/bloc/set_goal_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
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
        child: BlocProvider(
          create: (context) => LogInBloc(),
          child: BlocProvider(
            create: (context) => SignUpBloc(),
            child: InheritedThemeMode(
              themeMode: ValueNotifier(themeMode),
              child: BlocProvider(
                create: (context) => SetGoalBloc(),
                child: MyApp(),
              ),
            ),
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
    return OnUnFocusTap(
      child: ValueListenableBuilder(
        valueListenable: context.themeMode,
        builder: (context, themeMode, child) {
          return ValueListenableBuilder(
            valueListenable: context.locale,
            builder: (context, value, child) {
              return MaterialApp.router(
                builder: FToastBuilder(),
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
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }
}
