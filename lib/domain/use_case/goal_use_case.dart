import 'package:fundoo/data/models/goal.dart';
import 'package:fundoo/domain/repository/goal_repository_impl.dart';

class GoalUseCase {
  Future<Goal> createDraftGoal({
    required String name,
    required double targetAmount,
    String? targetDate,
    int? plannedMonths,
    required double savedAmount,
  }) async {
    final repository = GoalRepositoryImpl();
    return await repository.createDraftGoal(
      name: name,
      targetAmount: targetAmount,
      targetDate: targetDate,
      plannedMonths: plannedMonths,
      savedAmount: savedAmount,
    );
  }

  Future<Goal> activate({required String id}) async {
    final repository = GoalRepositoryImpl();
    return await repository.activate(id: id);
  }


  Future<List<Goal>> getActivatedGoals() async {
    final repository = GoalRepositoryImpl();
    return await repository.getActivatedGoals();
  }

  Future<void> editGoal({
    required String id,
    String? name,
    String? description,
    double? targetAmount,
    String? targetDate,
    int? plannedMonths,
  }) async {
    final repository = GoalRepositoryImpl();
    await repository.editGoal(
      id: id,
      name: name,
      description: description,
      targetAmount: targetAmount,
      targetDate: targetDate,
      plannedMonths: plannedMonths,
    );
  }

  Future<void> deleteGoal({required String id}) async {
    final repository = GoalRepositoryImpl();
    await repository.deleteGoal(id: id);
  }

  Future<void> addIncomeToGoal({
    required String goalId,
    required double amount,
    String? description,
    int? categoryId,
    int? manualCategoryId,
    String? customCategoryName,
  }) async {
    final repository = GoalRepositoryImpl();
    await repository.addIncomeToGoal(
      goalId: goalId,
      amount: amount,
      description: description,
      categoryId: categoryId,
      manualCategoryId: manualCategoryId,
      customCategoryName: customCategoryName,
    );
  }

  Future<void> addChargeToGoal({
    required String goalId,
    required double amount,
    String? description,
    int? categoryId,
    int? manualCategoryId,
    String? customCategoryName,
  }) async {
    final repository = GoalRepositoryImpl();
    await repository.addChargeToGoal(
      goalId: goalId,
      amount: amount,
      description: description,
      categoryId: categoryId,
      manualCategoryId: manualCategoryId,
      customCategoryName: customCategoryName,
    );
  }
}
