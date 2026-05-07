abstract class AuthRepository {
  Future<Map<String, dynamic>> registerNumberAndGetOTP(String phoneNumber);

  Future<Map<String, dynamic>> verifyOTP(String phoneNumber, String otp);

  Future<Map<String, dynamic>> registerUser(
    String fullName,
    String displayName,
    int age,
  );
}
