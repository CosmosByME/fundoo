part of 'statistic_bloc.dart';

class StatisticState extends Equatable {
  final Wallet? wallet;
  final String? error;
  final bool isLoading;
  const StatisticState({this.wallet, this.error, this.isLoading = false});

  StatisticState copyWith({
    Wallet? wallet,
    String? error,
    bool? isLoading,
  }) {
    return StatisticState(
      wallet: wallet ?? this.wallet,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [wallet, error, isLoading];
}
