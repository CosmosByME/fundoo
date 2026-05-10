part of 'set_goal_bloc.dart';

sealed class SetGoalEvent extends Equatable {
  const SetGoalEvent();

  @override
  List<Object> get props => [];
}

final class SetGoalNameChanged extends SetGoalEvent {
  final String name;

  const SetGoalNameChanged(this.name);

  @override
  List<Object> get props => [name];
}

final class SetGoalTargetAmountChanged extends SetGoalEvent {
  final double targetAmount;

  const SetGoalTargetAmountChanged(this.targetAmount);

  @override
  List<Object> get props => [targetAmount];
}

final class SetGoalTargetDateChanged extends SetGoalEvent {
  final String targetDate;

  const SetGoalTargetDateChanged(this.targetDate);

  @override
  List<Object> get props => [targetDate];
}

final class SetGoalPlannedMonthsChanged extends SetGoalEvent {
  final int plannedMonths;

  const SetGoalPlannedMonthsChanged(this.plannedMonths);

  @override
  List<Object> get props => [plannedMonths];
}

final class SetGoalSavedAmountChanged extends SetGoalEvent {
  final double savedAmount;

  const SetGoalSavedAmountChanged(this.savedAmount);

  @override
  List<Object> get props => [savedAmount];
}

final class SetGoalSubmitted extends SetGoalEvent {}

final class ActivateGoal extends SetGoalEvent {}
