part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class LoadActivatedGoals extends HomeEvent {}

final class EditActivatedGoal extends HomeEvent {
  final String goalId;
  final String name;
  final String? description;
  final double? targetAmount;
  final String? targetDate;
  final int? plannedMonths;

  EditActivatedGoal({
    required this.goalId,
    required this.name,
    this.description,
    this.targetAmount,
    this.targetDate,
    this.plannedMonths,
  });
}

final class DeleteActivatedGoal extends HomeEvent {
  final String goalId;

  DeleteActivatedGoal({required this.goalId});
}

final class AddIncomeToGoal extends HomeEvent {
  final String goalId;
  final double amount;
  final String? description;
  final int? categoryId;
  final int? manualCategoryId;
  final String? customCategoryName;

  AddIncomeToGoal({
    required this.goalId,
    required this.amount,
    this.description,
    this.categoryId,
    this.manualCategoryId,
    this.customCategoryName,
  });
}


final class AddChargeToGoal extends HomeEvent {
  final String goalId;
  final double amount;
  final String? description;
  final int? categoryId;
  final int? manualCategoryId;
  final String? customCategoryName;

  AddChargeToGoal({
    required this.goalId,
    required this.amount,
    this.description,
    this.categoryId,
    this.manualCategoryId,
    this.customCategoryName,
  });
}
