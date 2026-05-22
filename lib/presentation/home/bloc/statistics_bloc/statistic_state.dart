part of 'statistic_bloc.dart';

class StatisticState extends Equatable {
  final Wallet? wallet;
  final PieData? pieData;
  final String? error;
  final bool isLoading;
  const StatisticState({this.wallet, this.pieData, this.error, this.isLoading = false});

  StatisticState copyWith({
    Wallet? wallet,
    PieData? pieData,
    String? error,
    bool? isLoading,
  }) {
    return StatisticState(
      wallet: wallet ?? this.wallet,
      pieData: pieData ?? this.pieData,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [wallet, pieData, error, isLoading];
}
