part of 'set_goal_bloc.dart';

class SetGoalState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String? name;
  final double? targetAmount;
  final String? targetDate;
  final int? plannedMonths;
  final double? savedAmount;
  final bool isDone;
  final Goal? createdGoal;
  const SetGoalState({
    this.isLoading = false,
    this.errorMessage,
    this.name,
    this.targetAmount,
    this.targetDate,
    this.plannedMonths,
    this.savedAmount,
    this.createdGoal,
    this.isDone = false,
  });

  SetGoalState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? name,
    double? targetAmount,
    String? targetDate,
    int? plannedMonths,
    double? savedAmount,
    Goal? createdGoal,
    bool? isDone,
  }) {
    return SetGoalState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ,
      name: name ?? this.name,
      targetAmount: targetAmount ?? this.targetAmount,
      targetDate: targetDate ?? this.targetDate,
      plannedMonths: plannedMonths ?? this.plannedMonths,
      savedAmount: savedAmount ?? this.savedAmount,
      createdGoal: createdGoal ?? this.createdGoal,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    name,
    targetAmount,
    targetDate,
    plannedMonths,
    savedAmount,
    createdGoal,
    isDone,
  ];
}
