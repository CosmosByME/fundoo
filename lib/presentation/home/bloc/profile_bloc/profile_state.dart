part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final User? user;
  final bool isLoading;
  final String? errorMessage;
  final String? newPhoneNumber;

  const ProfileState({
    this.user,
    this.isLoading = false,
    this.errorMessage,
    this.newPhoneNumber,
  });

  ProfileState copyWith(
      {User? user, bool? isLoading, String? errorMessage, String? newPhoneNumber}) {
    return ProfileState(
      user: user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      newPhoneNumber: newPhoneNumber,
    );
  }

  @override
  List<Object?> get props => [user, isLoading, errorMessage, newPhoneNumber];
}
