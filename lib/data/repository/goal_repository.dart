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
}
