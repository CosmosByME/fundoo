import 'package:flutter/material.dart';

extension ThemeModeExtension on BuildContext {
  ValueNotifier<ThemeMode> get themeMode => InheritedThemeMode.of(this).themeMode;
}

class InheritedThemeMode extends InheritedWidget {
  final ValueNotifier<ThemeMode> themeMode;

  const InheritedThemeMode({
    super.key,
    required this.themeMode,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget is InheritedThemeMode && oldWidget.themeMode != themeMode;
  }


  static InheritedThemeMode of(BuildContext context) {
    final InheritedThemeMode? result =
        context.dependOnInheritedWidgetOfExactType<InheritedThemeMode>();
    assert(result != null, 'No InheritedTheme found in context');
    return result!;
  }
}