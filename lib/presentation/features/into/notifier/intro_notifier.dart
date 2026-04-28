import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n_inherited.dart';
import 'package:fundoo/core/services/preferences_service.dart';
import 'package:fundoo/core/widget/changing_locale.dart';
import 'package:go_router/go_router.dart';

class IntroNotifier extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    pageController.animateToPage(
      currentPage + 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPage += 1;
    notifyListeners();
  }

  void setPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  Future<void> setIntroSeen() async {
    PreferencesService.setIntroSeen();
  }

  Future<void> finishIntro(BuildContext context) async {
    await setIntroSeen();
    if (context.mounted) {
      context.go("/home");
    }
  }

  void changeLanguage(BuildContext context) async {
    final newLocale = await localeSelectingDialog(context);
    if (newLocale != null && context.mounted) {
      context.locale.value = newLocale;
      notifyListeners();
    }
  }
}
