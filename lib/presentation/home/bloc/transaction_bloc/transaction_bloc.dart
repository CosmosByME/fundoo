import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundoo/data/models/transaction.dart';
import 'package:fundoo/domain/use_case/transaction_use_case.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionState()) {
    on<LoadRecentTransactions>(loadRecentTransactions);
    on<LoadTransactionsEvent>(loadTransactionsByPage);
    on<RefreshTransactionsEvent>(refreshTransactions);
  }

  void loadRecentTransactions(
    LoadRecentTransactions event,
    Emitter<TransactionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final recentTransactions = await TransactionUseCase()
          .getRecentTransactions();
      emit(
        state.copyWith(
          isLoading: false,
          recentTransactions: recentTransactions,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void loadTransactionsByPage(
    LoadTransactionsEvent event,
    Emitter<TransactionState> emit,
  ) async {
    if (!state.isScrollable) return;
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {

      final transactions = await TransactionUseCase().getTransactionsByPage(
        state.page,
      );
      emit(
        state.copyWith(
          isLoading: false,
          transactions: [...?state.transactions, ...transactions],
          isScrollable: transactions.isNotEmpty,
          page: state.page + 1,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void refreshTransactions(
    RefreshTransactionsEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(state.copyWith(isScrollable: true, errorMessage: null, page: 1, transactions: []));
  }
}
