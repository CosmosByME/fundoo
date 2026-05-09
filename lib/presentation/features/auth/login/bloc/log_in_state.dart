part of 'log_in_bloc.dart';

class LogInState extends Equatable {
  final bool isLoading;
  final String phoneNumber;
  final bool otpSent;
  final bool isVerified;
  final String? errorMessage;

  const LogInState({
    this.isLoading = false,
    this.phoneNumber = '',
    this.isVerified = false,
    this.errorMessage,
    this.otpSent = false,
  });

  LogInState copyWith({
    bool? isLoading,
    String? phoneNumber,
    bool? isVerified,
    String? errorMessage,
    bool? otpSent,
  }) {
    return LogInState(
      isLoading: isLoading ?? this.isLoading,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isVerified: isVerified ?? this.isVerified,
      errorMessage: errorMessage ?? this.errorMessage,
      otpSent: otpSent ?? this.otpSent,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    phoneNumber,
    isVerified,
    errorMessage,
    otpSent,
  ];
}
