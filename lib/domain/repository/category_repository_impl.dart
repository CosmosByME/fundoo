import 'package:dio/dio.dart';
import 'package:fundoo/data/repository/category_repository.dart';

import '../../core/services/dio_service.dart';
import '../../data/models/category.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<List<Category>> getIncomeCategories() async {
    try {
      final response = await dio.get('/api/v1/Wallet/categories/income');

      if (response.statusCode == 200) {
        final List list = response.data['data'];
        return list.map<Category>((json) => Category.fromJson(json)).toList();
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
  Future<List<Category>> getExpanseCategories() async {
    try {
      final response = await dio.get('/api/v1/Wallet/categories/expense');

      if (response.statusCode == 200) {
        final List list = response.data['data'];
        return list.map<Category>((json) => Category.fromJson(json)).toList();
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
}