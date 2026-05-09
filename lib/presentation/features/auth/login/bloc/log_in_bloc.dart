import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundoo/domain/use_case/login_use_case.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInState()) {
    on<LogInPhoneNumberSubmitted>(_onPhoneNumberSubmitted);
    on<LogInOTPSubmitted>(_onOTPSubmitted);
  }

  void _onPhoneNumberSubmitted(
    LogInPhoneNumberSubmitted event,
    Emitter<LogInState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await LoginUseCase().sendLoginOTP(event.phoneNumber);
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
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  void _onOTPSubmitted(
    LogInOTPSubmitted event,
    Emitter<LogInState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await LoginUseCase().verifyLoginOTP(event.phoneNumber, event.otp);
      emit(state.copyWith(isLoading: false, isVerified: true));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(isVerified: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
