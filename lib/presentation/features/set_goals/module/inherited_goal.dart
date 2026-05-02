import 'package:flutter/material.dart';

import 'goal_notifier.dart';

extension InheritedGoalExt on BuildContext {
  InheritedGoal get goal => InheritedGoal.of(this)!;
}

class InheritedGoal extends InheritedWidget {

  final GoalNotifier goalNotifier;

  const InheritedGoal({
    super.key,
    required super.child,
    required this.goalNotifier,
  });

  static InheritedGoal? of(BuildContext context) {
    final InheritedGoal? result = context
        .dependOnInheritedWidgetOfExactType<InheritedGoal>();
    assert(result != null, 'No InheritedGoal found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedGoal oldWidget) {
    return goalNotifier != oldWidget.goalNotifier;
  }
}