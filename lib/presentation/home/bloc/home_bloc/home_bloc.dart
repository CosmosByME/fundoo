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
    on<EditActivatedGoal>(editGoal);
    on<DeleteActivatedGoal>(deleteGoal);
    on<AddIncomeToGoal>(addIncomeToGoal);
    on<AddChargeToGoal>(addChargeToGoal);
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

  void editGoal(
    EditActivatedGoal event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await GoalUseCase().editGoal(
        id: event.goalId,
        name: event.name,
        description: event.description,
        targetAmount: event.targetAmount,
        targetDate: event.targetDate,
        plannedMonths: event.plannedMonths,
      );
      add(LoadActivatedGoals());
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void deleteGoal(
    DeleteActivatedGoal event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await GoalUseCase().deleteGoal(id: event.goalId);
      add(LoadActivatedGoals());
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void addIncomeToGoal(
    AddIncomeToGoal event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await GoalUseCase().addIncomeToGoal(
        goalId: event.goalId,
        amount: event.amount,
        description: event.description,
        categoryId: event.categoryId,
        manualCategoryId: event.manualCategoryId,
        customCategoryName: event.customCategoryName,
      );
      // add(LoadActivatedGoals());
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void addChargeToGoal(
      AddChargeToGoal event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await GoalUseCase().addChargeToGoal(
        goalId: event.goalId,
        amount: event.amount,
        description: event.description,
        categoryId: event.categoryId,
        manualCategoryId: event.manualCategoryId,
        customCategoryName: event.customCategoryName,
      );
      // add(LoadActivatedGoals());
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
