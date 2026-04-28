import 'package:flutter/material.dart';

extension L10nInheritedExt on BuildContext {
  ValueNotifier<Locale> get locale => L10nInherited.of(this)!.locale;
}

class L10nInherited extends InheritedWidget {
  final ValueNotifier<Locale> locale;

  const L10nInherited({
    super.key,
    required this.locale,
    required super.child,
  });

  static L10nInherited? of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<L10nInherited>();
    assert(result != null, 'No L10nInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return locale != (oldWidget as L10nInherited).locale;
  }
}