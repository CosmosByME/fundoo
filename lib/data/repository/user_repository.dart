import '../models/user.dart';

abstract class UserRepository {
  Future<User> getUserProfile();

  Future<User> updateUserProfile({
    String? displayName,
    String? fullName,
    int? age,
    String? bio,
  });

  Future<void> changePhoneStep1({String newPhoneNumber});

  Future<Map<String, dynamic>> changePhoneStep2({
    String newPhoneNumber,
    String verificationCode,
  });

  Future<void> deleteUserAccount();
}
