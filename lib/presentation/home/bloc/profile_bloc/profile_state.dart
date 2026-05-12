part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final User? user;
  final bool isLoading;
  final String? errorMessage;

  const ProfileState({
    this.user,
    this.isLoading = false,
    this.errorMessage,
  });

  ProfileState copyWith({User? user, bool? isLoading, String? errorMessage}) {
    return ProfileState(
      user: user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [user, isLoading, errorMessage];
}
