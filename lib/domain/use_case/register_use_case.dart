import 'package:fundoo/domain/repository/auth_repository_impl.dart';

import '../../core/services/preferences_service.dart';

class RegisterUseCase {
  final repository = AuthRepositoryImpl();


  Future<void> sendOTP(String phoneNumber) async {
    await repository.registerNumberAndGetOTP(phoneNumber);
  }

  Future<void> verifyOTP(String phoneNumber, String otp) async {
    Map<String, dynamic> data = await repository.verifyOTP(phoneNumber, otp);
    String accessToken = data['accessToken'];
    String refreshToken = data['refreshToken'];
    await PreferencesService.setAccessToken(accessToken);
    await PreferencesService.setRefreshToken(refreshToken);
  }

  Future<void> registerUser(
    String fullName,
    String displayName,
    int age,
  ) async {
    await repository.registerUser(fullName, displayName, age);
  }
}