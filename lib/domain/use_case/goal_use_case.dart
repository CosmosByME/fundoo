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
}
