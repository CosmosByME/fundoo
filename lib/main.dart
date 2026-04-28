import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n_inherited.dart';
import 'package:fundoo/core/l10n/outputs/app_localizations.dart';
import 'package:fundoo/core/router.dart';

void main() {
  runApp(
    L10nInherited(locale: ValueNotifier(Locale('uz')), child: const MyApp()),
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
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: router,
        );
      }
    );
  }
}
