import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundoo/data/models/goal.dart';
import 'package:fundoo/domain/use_case/goal_use_case.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<LoadActivatedGoals>(loadActivatedGoals);
  }

  void loadActivatedGoals(
    LoadActivatedGoals event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final list = await GoalUseCase().getActivatedGoals();
      List<Goal?> activatedGoals = list;
      emit(state.copyWith(isLoading: false, activatedGoals: activatedGoals));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
