part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class LoadRecentTransactions extends TransactionEvent {}

class LoadTransactionsEvent extends TransactionEvent {
  final int page;
  const LoadTransactionsEvent(this.page);

  @override
  List<Object> get props => [page];
}

class RefreshTransactionsEvent extends TransactionEvent {}
