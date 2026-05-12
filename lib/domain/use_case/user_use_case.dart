import 'package:fundoo/data/models/user.dart';
import 'package:fundoo/domain/repository/user_repository_impl.dart';

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
}