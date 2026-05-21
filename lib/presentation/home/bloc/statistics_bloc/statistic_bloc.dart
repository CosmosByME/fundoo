import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundoo/data/models/wallet.dart';
import 'package:fundoo/domain/use_case/wallet_use_case.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc() : super(StatisticState()) {
    on<LoadStatisticsEvent>(loadStatistics);
  }

  void loadStatistics(
    LoadStatisticsEvent event,
    Emitter<StatisticState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));
      final wallet = await WalletUseCase().getWallet();
      emit(state.copyWith(wallet: wallet, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(error: null));
    }
  }
}
