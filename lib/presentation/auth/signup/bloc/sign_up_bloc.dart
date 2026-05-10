import 'package:bloc/bloc.dart';

import '../../../../domain/use_case/register_use_case.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final registerUseCase = RegisterUseCase();
  SignUpBloc() : super(SignUpState()) {
    on<SignUpPhoneNumberSubmitted>(_onPhoneNumberSubmitted);
    on<SignUpOTPSubmitted>(_onOTPSubmitted);
    on<SignUpUserDetailsSubmitted>(_onUserDetailsSubmitted);
  }

  void _onPhoneNumberSubmitted(
    SignUpPhoneNumberSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await registerUseCase.sendOTP(event.phoneNumber);
      emit(
        state.copyWith(
          phoneNumber: event.phoneNumber,
          isLoading: false,
          otpSent: true,
        ),
      );
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(otpSent: false));
    } catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(state.copyWith(errorMessage: message, isLoading: false));
    }
  }

  void _onOTPSubmitted(
    SignUpOTPSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await registerUseCase.verifyOTP(event.phoneNumber, event.otp);
      emit(state.copyWith(isLoading: false, isVerified: true));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(isVerified: false));
    } catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(state.copyWith(errorMessage: message, isLoading: false));
    }
  }

  void _onUserDetailsSubmitted(
    SignUpUserDetailsSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await registerUseCase.registerUser(
        event.fullName,
        event.displayName,
        event.age,
      );
      emit(
        state.copyWith(
          fullName: event.fullName,
          displayName: event.displayName,
          age: event.age,
          isLoading: false,
        ),
      );
    } catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(state.copyWith(errorMessage: message, isLoading: false));
    }
  }
}
