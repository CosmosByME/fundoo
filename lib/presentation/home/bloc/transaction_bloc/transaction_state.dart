part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  final List<Transaction>? transactions;
  final List<Transaction>? recentTransactions;
  final bool isScrollable;
  final int page;
  final bool isLoading;
  final String? errorMessage;
  const TransactionState({
    this.transactions,
    this.recentTransactions,
    this.isScrollable = true,
    this.isLoading = false,
    this.errorMessage,
    this.page = 1,
  });

  TransactionState copyWith({
    List<Transaction>? transactions,
    List<Transaction>? recentTransactions,
    bool? isLoading,
    String? errorMessage,
    bool? isScrollable,
    int? page,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
      recentTransactions: recentTransactions ?? this.recentTransactions,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isScrollable: isScrollable ?? this.isScrollable,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
    transactions,
    recentTransactions,
    isLoading,
    errorMessage,
    isScrollable,
    page,
  ];
}
