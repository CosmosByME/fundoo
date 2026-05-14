part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final User? user;
  final bool isLoading;
  final String? errorMessage;
  final String? newPhoneNumber;
  final bool isPhoneNumberChangeIsDone;
  final bool isOtpSent;

  const ProfileState({
    this.user,
    this.isLoading = false,
    this.errorMessage,
    this.newPhoneNumber,
    this.isPhoneNumberChangeIsDone = false,
    this.isOtpSent = false,
  });

  ProfileState copyWith({
    User? user,
    bool? isLoading,
    String? errorMessage,
    String? newPhoneNumber,
    bool? isPhoneNumberChangeIsDone,
    bool? isOtpSent,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      newPhoneNumber: newPhoneNumber ?? this.newPhoneNumber,
      isPhoneNumberChangeIsDone:
          isPhoneNumberChangeIsDone ?? this.isPhoneNumberChangeIsDone,
      isOtpSent: isOtpSent ?? this.isOtpSent,
    );
  }

  @override
  List<Object?> get props => [
    user,
    isLoading,
    errorMessage,
    newPhoneNumber,
    isPhoneNumberChangeIsDone,
    isOtpSent,
  ];
}
