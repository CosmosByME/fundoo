import 'package:dio/dio.dart';
import 'package:fundoo/core/services/dio_service.dart';
import 'package:fundoo/data/models/goal.dart';
import 'package:fundoo/data/repository/goal_repository.dart';

class GoalRepositoryImpl implements GoalRepository {
  @override
  Future<Goal> createDraftGoal({
    required String name,
    required double targetAmount,
    String? targetDate,
    int? plannedMonths,
    required double savedAmount,
  }) async {
    try {
      final data = {
        'name': name,
        'goalType': 1,
        'targetAmount': targetAmount,
        'currency': 1,
        'savedAmount': savedAmount,
      };
      if (plannedMonths != null) {
        data['plannedMonths'] = plannedMonths;
      } else if (targetDate != null) {
        data['targetDate'] = targetDate;
      }

      final response = await dio.post('/api/v1/Goals', data: data);

      if (response.statusCode == 201) {
        return Goal.fromJson(response.data['data']);
      } else {
        throw Exception(
          'Failed to create draft goal: ${response.statusCode} - ${response
              .data}',
        );
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while creating draft goal: $e');
    }
  }

  @override
  Future<Goal> activate({required String id}) async {
    try {
      final response = await dio.post('/api/v1/Goals/$id/activate');

      if (response.statusCode == 200) {
        return Goal.fromJson(response.data['data']);
      } else {
        throw Exception(
          'Failed to activate goal: ${response.statusCode} - ${response.data}',
        );
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while activating goal: $e');
    }
  }

  @override
  Future<List<Goal>> getActivatedGoals() async {
    try {
      final response = await dio.get('/api/v1/Goals/active');

      if (response.statusCode == 200) {
        final List list = response.data['data'];
        return list.map<Goal>((json) => Goal.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to fetch goals: ${response.statusCode} - ${response.data}',
        );
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while activating goal: $e');
    }
  }

  @override
  Future<Goal> editGoal({
    required String id,
    String? name,
    String? description,
    double? targetAmount,
    String? targetDate,
    int? plannedMonths,
  }) async {
    try {
      final data = {
        'name': name,
        'description': description,
        'targetAmount': targetAmount,
      };
      if (plannedMonths != null) {
        data['plannedMonths'] = plannedMonths;
      } else if (targetDate != null) {
        data['targetDate'] = targetDate;
      }
      final response = await dio.put('/api/v1/Goals/$id', data: data);

      if (response.statusCode == 200) {
        return Goal.fromJson(response.data['data']);
      } else {
        throw Exception(
          'Failed to fetch goals: ${response.statusCode} - ${response.data}',
        );
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while activating goal: $e');
    }
  }


  @override
  Future<void> deleteGoal({required String id}) async {
    try {
      final response = await dio.delete('/api/v1/Goals/$id');

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to delete goal: ${response.statusCode} - ${response.data}',
        );
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while deleting goal: $e');
    }
  }

  @override
  Future<void> addIncomeToGoal({
    required String goalId,
    required double amount,
    String? description,
    int? categoryId,
    int? manualCategoryId,
    String? customCategoryName,
  }) async {
    try {
      final data = {
        'amount': amount,
        'goalId': goalId,
        'description': description,
        'categoryId': categoryId,
        'manualCategoryId': manualCategoryId,
        'customCategoryName': customCategoryName,
      };
      await dio.post("/api/v1/Wallet/add-money", data: data);
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while deleting goal: $e');
    }
  }

  @override
  Future<void> addChargeToGoal({
    required String goalId,
    required double amount,
    String? description,
    int? categoryId,
    int? manualCategoryId,
    String? customCategoryName,
  }) async {
    try {
      final data = {
        'amount': amount,
        'goalId': goalId,
        'description': description,
        'categoryId': categoryId,
        'manualCategoryId': manualCategoryId,
        'customCategoryName': customCategoryName,
      };
      await dio.post("/api/v1/Wallet/charge-money", data: data);
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while deleting goal: $e');
    }
  }
}