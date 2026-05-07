part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpPhoneNumberSubmitted extends SignUpEvent {
  final String phoneNumber;

  SignUpPhoneNumberSubmitted(this.phoneNumber);
}

final class SignUpOTPSubmitted extends SignUpEvent {
  final String phoneNumber;
  final String otp;

  SignUpOTPSubmitted(this.phoneNumber, this.otp);
}

final class SignUpUserDetailsSubmitted extends SignUpEvent {
  final String fullName;
  final String displayName;
  final int age;

  SignUpUserDetailsSubmitted(
    this.fullName,
    this.displayName,
    this.age,
  );
}
