import 'package:fundoo/data/models/goal.dart';

abstract class GoalRepository {
  Future<Goal> createDraftGoal({
    required String name,
    required double targetAmount,
    String? targetDate,
    int? plannedMonths,
    required double savedAmount,
  });

  Future<Goal> activate({required String id});


  Future<List<Goal>> getActivatedGoals();

  Future<Goal> editGoal({
    required String id,
    String? name,
    String? description,
    double? targetAmount,
    String? targetDate,
    int? plannedMonths,
  });

  Future<void> deleteGoal({required String id});

  Future<void> addIncomeToGoal({
    required String goalId,
    required double amount,
    String? description,
    int? categoryId,
    int? manualCategoryId,
    String? customCategoryName,
  });

  Future<void> addChargeToGoal({
    required String goalId,
    required double amount,
    String? description,
    int? categoryId,
    int? manualCategoryId,
    String? customCategoryName,
  });
}
