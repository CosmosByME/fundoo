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


//Here will be events for working with user profile_picture.
