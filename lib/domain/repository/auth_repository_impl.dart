import 'package:fundoo/core/services/dio_service.dart';
import 'package:fundoo/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  //Register
  @override
  Future<Map<String, dynamic>> registerNumberAndGetOTP(
    String phoneNumber,
  ) async {
    try {
      final response = await dio.post(
        '/api/v1/Auth/register',
        data: {'phoneNumber': phoneNumber},
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else if (response.statusCode == 429) {
        throw Exception("Too many requests. Please try again later.");
      } else {
        throw Exception(
          "Error: ${response.statusCode} - ${response.data['error']}",
        );
      }
    } catch (e) {
      throw Exception('Failed to register number: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> verifyOTP(String phoneNumber, String otp) async {
    try {
      final response = await dio.post(
        '/api/v1/Auth/otp/verify',
        data: {'phoneNumber': phoneNumber, 'otpCode': otp},
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else if (response.statusCode == 429) {
        throw Exception("Too many requests. Please try again later.");
      } else {
        throw Exception(
          "Error: ${response.statusCode} - ${response.data['error']}",
        );
      }
    } catch (e) {
      throw Exception('Failed to verify OTP: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> registerUser(
    String fullName,
    String displayName,
    int age,
  ) async {
    try {
      final response = await dio.put(
        '/api/v1/User/me',
        data: {"displayName": displayName, "fullname": fullName, "age": age},
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else if (response.statusCode == 429) {
        throw Exception("Too many requests. Please try again later.");
      } else {
        throw Exception(
          "Error: ${response.statusCode} - ${response.data['error']}",
        );
      }
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  //Login
  @override
  Future<Map<String, dynamic>> loginNumberAndGetOTP(String phoneNumber) async {
    try {
      final response = await dio.post(
        '/api/v1/Auth/otp/send',
        data: {'phoneNumber': phoneNumber},
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else if (response.statusCode == 429) {
        throw Exception("Too many requests. Please try again later.");
      } else {
        throw Exception(
          "Error: ${response.statusCode} - ${response.data['error']}",
        );
      }
    } catch (e) {
      throw Exception('Failed to login number: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> verifyLoginOTP(
    String phoneNumber,
    String otp,
  ) async {
    try {
      final response = await dio.post(
        '/api/v1/Auth/login',
        data: {'phoneNumber': phoneNumber, 'otpCode': otp},
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else if (response.statusCode == 429) {
        throw Exception("Too many requests. Please try again later.");
      } else {
        throw Exception(
          "Error: ${response.statusCode} - ${response.data['error']}",
        );
      }
    } catch (e) {
      throw Exception('Failed to verify login OTP: $e');
    }
  }
}
