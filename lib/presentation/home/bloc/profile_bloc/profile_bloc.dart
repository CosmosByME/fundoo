import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/user.dart';
import '../../../../domain/use_case/user_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<LoadUserProfile>(_loadUserProfile);
    on<UpdateUserProfile>(_updateUserProfile);
    on<ChangePhoneNumber>(_changePhoneNumber);
    on<VerifyPhoneNumberChange>(_verifyPhoneNumberChange);
    on<DeleteUserAccount>(_deleteUserAccount);
  }

  void _loadUserProfile(
    LoadUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final user = await UserUseCase().getUserProfile();
      emit(state.copyWith(user: user, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString().replaceFirst("Exception: ", ''),
        ),
      );
    }
  }

  void _updateUserProfile(
    UpdateUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final updatedUser = await UserUseCase().updateUserProfile(
        displayName: event.displayName,
        fullName: event.fullName,
        age: event.age,
        bio: event.bio,
      );
      emit(state.copyWith(user: updatedUser, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString().replaceFirst("Exception: ", ''),
        ),
      );
    }
  }

  void _changePhoneNumber(
    ChangePhoneNumber event,
    Emitter<ProfileState> emit,
  ) async {
    if (event.currentPhoneNumber == event.newPhoneNumber) {
      emit(
        state.copyWith(
          errorMessage:
              "New phone number cannot be the same as the current one.",
        ),
      );
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(errorMessage: null));
      add(LoadUserProfile());
      return;
    } else if (state.user!.phoneNumber != "+${event.currentPhoneNumber}") {
      emit(
        state.copyWith(
          errorMessage:
              "Current phone number does not match the user's phone number.",
        ),
      );
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(errorMessage: null));
      add(LoadUserProfile());
      return;
    } else {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      try {
        await UserUseCase().sendOTPtoChangePhoneNumber(
          newPhoneNumber: event.newPhoneNumber,
        );
        emit(
          state.copyWith(
            isLoading: false,
            newPhoneNumber: event.newPhoneNumber,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: e.toString().replaceFirst("Exception: ", ''),
          ),
        );
      }
    }
  }

  void _verifyPhoneNumberChange(
    VerifyPhoneNumberChange event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await UserUseCase().verifyOTPtoChangePhoneNumber(
        newPhoneNumber: event.newPhoneNumber,
        verificationCode: event.verificationCode,
      );
      emit(state.copyWith(isLoading: false, newPhoneNumber: null));
      // After successful phone number change, we can reload the user profile to get updated data
      add(LoadUserProfile());
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString().replaceFirst("Exception: ", ''),
        ),
      );
    }
  }

  void _deleteUserAccount(
    DeleteUserAccount event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await UserUseCase().deleteUserAccount();
      emit(
        state.copyWith(
          isLoading: false,
          user: null,
          errorMessage: null,
          newPhoneNumber: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString().replaceFirst("Exception: ", ''),
        ),
      );
    }
  }
}
