import 'package:dio/dio.dart';
import 'package:fundoo/core/services/dio_service.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
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
      showErrorToast(message);
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
      showErrorToast(message);
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while updating user profile: $e');
    }
  }

  @override
  Future<void> changePhoneStep1({String? newPhoneNumber}) async {
    try {
      final data = {'newPhoneNumber': newPhoneNumber};

      final response = await dio.post("/api/v1/User/me/phone/otp", data: data);
      if (response.statusCode != 200) {
        throw Exception(
          'Failed to initiate phone number change: ${response.statusCode} - ${response.data}',
        );
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
          data?['detail'] ??
          e.message ??
          'Unknown error';
        showErrorToast(message);
      throw Exception(message);
    } catch (e) {
      throw Exception(
        'Error occurred while initiating phone number change: $e',
      );
    }
  }

  @override
  Future<Map<String, dynamic>> changePhoneStep2({
    String? newPhoneNumber,
    String? verificationCode,
  }) async {
    try {
      final data = {
        'newPhoneNumber': newPhoneNumber,
        'otpCode': verificationCode,
      };

      final response = await dio.put("/api/v1/User/me/phone", data: data);

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to complete phone number change: ${response.statusCode} - ${response.data}',
        );
      } else {
        return response.data['data'];
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
          data?['detail'] ??
          e.message ??
          'Unknown error';
      showErrorToast(message);
      throw Exception(message);
    } catch (e) {
      throw Exception(
        'Error occurred while completing phone number change: $e',
      );
    }
  }

  @override
  Future<void> deleteUserAccount() async {
    try {
      final response = await dio.delete("/api/v1/User/me");
      if (response.statusCode != 204) {
        throw Exception(
          'Failed to delete user account: ${response.statusCode} - ${response.data}',
        );
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
          data?['detail'] ??
          e.message ??
          'Unknown error';
      showErrorToast(message);
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while deleting user account: $e');
    }
  }
}
