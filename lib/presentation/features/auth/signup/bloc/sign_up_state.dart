part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final bool isLoading;
  final String phoneNumber;
  final String fullName;
  final String displayName;
  final int age;
  final bool isVerified;
  final String? errorMessage;
  final bool otpSent;

  const SignUpState({
    this.phoneNumber = '',
    this.fullName = '',
    this.displayName = '',
    this.age = 0,
    this.isLoading = false,
    this.errorMessage,
    this.isVerified = false,
    this.otpSent = false,
  });

  SignUpState copyWith({
    String? phoneNumber,
    String? fullName,
    String? displayName,
    int? age,
    bool? isLoading,
    String? errorMessage,
    bool? isVerified,
    bool? otpSent,
  }) {
    return SignUpState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      displayName: displayName ?? this.displayName,
      age: age ?? this.age,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isVerified: isVerified ?? this.isVerified,
      otpSent: otpSent ?? this.otpSent,
    );
  }

  @override
  List<Object?> get props => [
    phoneNumber,
    fullName,
    displayName,
    age,
    isLoading,
    errorMessage,
    isVerified,
    otpSent,
  ];
}
