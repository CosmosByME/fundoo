import 'package:fundoo/data/models/user.dart';
import 'package:fundoo/domain/repository/user_repository_impl.dart';

import '../../core/services/preferences_service.dart';

class UserUseCase {
  Future<User> getUserProfile() async {
    final user = await UserRepositoryImpl().getUserProfile();
    //Later here will be user photo downloading and caching logic
    return user;
  }

  Future<User> updateUserProfile({
    String? displayName,
    String? fullName,
    int? age,
    String? bio,
  }) async {
    final updatedUser = await UserRepositoryImpl().updateUserProfile(
      displayName: displayName,
      fullName: fullName,
      age: age,
      bio: bio,
    );
    return updatedUser;
  }

  Future<void> sendOTPtoChangePhoneNumber({
    required String newPhoneNumber,
  }) async {
    await UserRepositoryImpl().changePhoneStep1(newPhoneNumber: newPhoneNumber);
  }

  Future<void> verifyOTPtoChangePhoneNumber({
    required String newPhoneNumber,
    required String verificationCode,
  }) async {
    final data = await UserRepositoryImpl().changePhoneStep2(
      newPhoneNumber: newPhoneNumber,
      verificationCode: verificationCode,
    );

    String accessToken = data['accessToken'];
    String refreshToken = data['refreshToken'];
    await PreferencesService.setAccessToken(accessToken);
    await PreferencesService.setRefreshToken(refreshToken);
  }


  Future<void> deleteUserAccount() async {
    await UserRepositoryImpl().deleteUserAccount();
    await PreferencesService.clearTokens();
  }
}
