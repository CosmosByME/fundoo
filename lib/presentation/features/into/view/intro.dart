import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/l10n/l10n_inherited.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/presentation/features/into/notifier/inherited_intro.dart';
import 'package:fundoo/presentation/features/into/view/intro3.dart';
import 'package:fundoo/presentation/features/into/view/intro1.dart';
import 'package:fundoo/presentation/features/into/view/intro2.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    final state = InheritedIntro.of(context).notifier;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: ElevatedButton(
          onPressed: () => state.changeLanguage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2563EB).withValues(alpha: 0.3),
            elevation: 0,
            padding: EdgeInsets.zero,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              context.locale.value == Locale("uz")
                  ? "O'zbek"
                  : context.locale.value == Locale("en")
                  ? "English"
                  : "Русский",
              style: TextStyle(color: Color(0xFF2563EB)),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await state.finishIntro(context);
            },
            child: Text(
              context.l10n.skip,
              style: TextStyle(
                color: Color(0xFF2563EB),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: PageView(
              controller: state.pageController,
              children: [IntroOne(), IntroTwo(), IntroThree()],
              onPageChanged: (index) {
                state.setPage(index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 48),
            child: ListenableBuilder(
              listenable: state,
              builder: (context, _) {
                return CustomButton(
                  backgroundColor: Color(0xFF2563EB),
                  onPressed: state.currentPage == 2
                      ? () {
                          state.finishIntro(context);
                        }
                      : () {
                          state.nextPage();
                        },
                  child: Text(
                    state.currentPage == 2
                        ? "${context.l10n.next} 🚀"
                        : context.l10n.next,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
