import 'package:flutter/material.dart';
import 'package:fundoo/presentation/features/auth/signup/notifier/signup_notifier.dart';

extension InheritedSignupExt on BuildContext {
  InheritedSignup get signup => InheritedSignup.of(this)!;
}

class InheritedSignup extends InheritedWidget {

  final SignupNotifier signupNotifier;

  const InheritedSignup({
    super.key,
    required super.child,
    required this.signupNotifier,
  });

  static InheritedSignup? of(BuildContext context) {
    final InheritedSignup? result = context
        .dependOnInheritedWidgetOfExactType<InheritedSignup>();
    assert(result != null, 'No InheritedIntro found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedSignup oldWidget) {
    return signupNotifier != oldWidget.signupNotifier;
  }
}