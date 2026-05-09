import 'package:fundoo/core/services/preferences_service.dart';
import 'package:fundoo/domain/repository/auth_repository_impl.dart';

class LoginUseCase {
  Future<void> sendLoginOTP(String phoneNumber) async {
    final repository = AuthRepositoryImpl();
    await repository.loginNumberAndGetOTP(phoneNumber);
  }

  Future<void> verifyLoginOTP(String phoneNumber, String otp) async {
    final repository = AuthRepositoryImpl();
    Map<String, dynamic> data = await repository.verifyLoginOTP(
      phoneNumber,
      otp,
    );
    String accessToken = data['accessToken'];
    String refreshToken = data['refreshToken'];
    await PreferencesService.setAccessToken(accessToken);
    await PreferencesService.setRefreshToken(refreshToken);
  }
}
