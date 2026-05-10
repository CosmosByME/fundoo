import 'package:flutter/widgets.dart';
import 'package:fundoo/presentation/into/notifier/intro_notifier.dart';

class InheritedIntro extends InheritedWidget {
  final IntroNotifier notifier;

  const InheritedIntro({
    super.key,
    required this.notifier,
    required super.child,
  });

  static InheritedIntro of(BuildContext context) {
    final InheritedIntro? result = context
        .dependOnInheritedWidgetOfExactType<InheritedIntro>();
    assert(result != null, 'No InheritedIntro found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedIntro oldWidget) {
    return notifier != oldWidget.notifier;
  }
}
