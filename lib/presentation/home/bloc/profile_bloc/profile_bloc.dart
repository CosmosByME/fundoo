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
}
