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
      if(plannedMonths != null) {
        data['plannedMonths'] = plannedMonths;
      } else if(targetDate != null) {
        data['targetDate'] = targetDate;
      }


      final responce = await dio.post('/api/v1/Goals', data: data);

      if (responce.statusCode == 201) {
        return Goal.fromJson(responce.data['data']);
      } else {
        throw Exception(
          'Failed to create draft goal: ${responce.statusCode} - ${responce.data}',
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
      final responce = await dio.post('/api/v1/Goals/$id/activate');

      if (responce.statusCode == 200) {
        return Goal.fromJson(responce.data['data']);
      } else {
        throw Exception(
          'Failed to activate goal: ${responce.statusCode} - ${responce.data}',
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
}
