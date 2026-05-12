part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


final class LoadUserProfile extends ProfileEvent {}

final class UpdateUserProfile extends ProfileEvent {
  final String? displayName;
  final String? fullName;
  final int? age;
  final String? bio;

  UpdateUserProfile({
    this.displayName,
    this.fullName,
    this.age,
    this.bio,
  });
}

final class ChangePhoneNumber extends ProfileEvent {
  final String currentPhoneNumber;
  final String newPhoneNumber;

  ChangePhoneNumber({required this.newPhoneNumber, required this.currentPhoneNumber});
}

final class VerifyPhoneNumberChange extends ProfileEvent {
  final String newPhoneNumber;
  final String verificationCode;

  VerifyPhoneNumberChange({
    required this.newPhoneNumber,
    required this.verificationCode,
  });
}


final class DeleteUserAccount extends ProfileEvent {}


//Here will be events for working with user profile_picture.
