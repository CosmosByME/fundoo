part of 'log_in_bloc.dart';

sealed class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

final class LogInPhoneNumberSubmitted extends LogInEvent {
  final String phoneNumber;

  const LogInPhoneNumberSubmitted(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

final class LogInOTPSubmitted extends LogInEvent {
  final String phoneNumber;
  final String otp;

  const LogInOTPSubmitted(this.phoneNumber, this.otp);

  @override
  List<Object> get props => [phoneNumber, otp];
}
