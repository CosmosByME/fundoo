part of 'statistic_bloc.dart';

sealed class StatisticEvent extends Equatable {
  const StatisticEvent();

  @override
  List<Object> get props => [];
}

class LoadStatisticsEvent extends StatisticEvent {}

class LoadPieDataEvent extends StatisticEvent {
  final int period;

  const LoadPieDataEvent(this.period);

  @override
  List<Object> get props => [period];
}