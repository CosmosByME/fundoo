import 'package:dio/dio.dart';
import 'package:fundoo/core/services/dio_service.dart';
import 'package:fundoo/data/repository/user_repository.dart';

import '../../data/models/user.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> getUserProfile() async {
    try {
      final response = await dio.get("/api/v1/User/me");
      if (response.statusCode == 200) {
        return User.fromJson(response.data['data']);
      } else {
        throw Exception(
          'Failed to fetch user profile: ${response.statusCode} - ${response.data}',
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
      throw Exception('Error occurred while fetching user profile: $e');
    }
  }

  @override
  Future<User> updateUserProfile({
    String? displayName,
    String? fullName,
    int? age,
    String? bio,
  }) async {
    try {
      final data = {
        'displayName': displayName,
        'fullname': fullName,
        'age': age,
        'bio': bio,
      };

      final response = await dio.put("/api/v1/User/me", data: data);
      if (response.statusCode == 200) {
        return User.fromJson(response.data['data']);
      } else {
        throw Exception(
          'Failed to update user profile: ${response.statusCode} - ${response.data}',
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
      throw Exception('Error occurred while updating user profile: $e');
    }
  }
}
