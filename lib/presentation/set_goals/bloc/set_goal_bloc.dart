import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundoo/data/models/goal.dart';
import 'package:fundoo/domain/use_case/goal_use_case.dart';

part 'set_goal_event.dart';
part 'set_goal_state.dart';

class SetGoalBloc extends Bloc<SetGoalEvent, SetGoalState> {
  SetGoalBloc() : super(SetGoalState()) {
    on<SetGoalNameChanged>(_onSetGoalName);
    on<SetGoalTargetAmountChanged>(_onSetGoalTargetAmount);
    on<SetGoalTargetDateChanged>(_onSetGoalTargetDate);
    on<SetGoalPlannedMonthsChanged>(_onSetGoalPlannedMonths);
    on<SetGoalSavedAmountChanged>(_onSetGoalSavedAmount);
    on<SetGoalSubmitted>(_onSetGoalSubmitted);
    on<ActivateGoal>(_onActivateGoal);
  }

  void _onSetGoalName(SetGoalNameChanged event, Emitter<SetGoalState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onSetGoalTargetAmount(
    SetGoalTargetAmountChanged event,
    Emitter<SetGoalState> emit,
  ) {
    emit(state.copyWith(targetAmount: event.targetAmount));
  }

  void _onSetGoalTargetDate(
    SetGoalTargetDateChanged event,
    Emitter<SetGoalState> emit,
  ) {
    emit(SetGoalState(
      name: state.name,
      targetAmount: state.targetAmount,
      targetDate: event.targetDate,
      plannedMonths: null,
      savedAmount: state.savedAmount,
    ));
  }

  void _onSetGoalPlannedMonths(
    SetGoalPlannedMonthsChanged event,
    Emitter<SetGoalState> emit,
  ) {
    emit(SetGoalState(
      name: state.name,
      targetAmount: state.targetAmount,
      targetDate: null,
      plannedMonths: event.plannedMonths,
      savedAmount: state.savedAmount,
    ));
  }

  void _onSetGoalSavedAmount(
    SetGoalSavedAmountChanged event,
    Emitter<SetGoalState> emit,
  ) {
    emit(state.copyWith(savedAmount: event.savedAmount));
  }

  void _onSetGoalSubmitted(
    SetGoalSubmitted event,
    Emitter<SetGoalState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      Goal goal = await GoalUseCase().createDraftGoal(
        name: state.name!,
        targetAmount: state.targetAmount!,
        savedAmount: state.savedAmount!,
        targetDate: state.targetDate,
        plannedMonths: state.plannedMonths,
      );
      emit(state.copyWith(isLoading: false, createdGoal: goal));
    } catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(state.copyWith(errorMessage: message, isLoading: false));
    }
  }

  void _onActivateGoal(ActivateGoal event, Emitter<SetGoalState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      Goal activatedGoal = await GoalUseCase().activate(
        id: state.createdGoal!.id!,
      );
      emit(
        state.copyWith(
          isLoading: false,
          createdGoal: activatedGoal,
          isDone: true,
        ),
      );
      await Future.delayed(const Duration(seconds: 1));
      emit(
        SetGoalState(
          isDone: false,
          createdGoal: null,
          name: null,
          targetAmount: null,
          targetDate: null,
          plannedMonths: null,
          savedAmount: null,
          errorMessage: null,
          isLoading: false,
        ),
      );
    } catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(state.copyWith(errorMessage: message, isLoading: false));
    }
  }
}
