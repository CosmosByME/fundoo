import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/presentation/home/bloc/home_bloc/home_bloc.dart';
import 'package:fundoo/presentation/home/bloc/profile_bloc/profile_bloc.dart';
import 'package:fundoo/presentation/home/bloc/statistics_bloc/statistic_bloc.dart';
import 'package:fundoo/presentation/home/bloc/transaction_bloc/transaction_bloc.dart';

void initializeEverything(BuildContext context) {
  context.read<ProfileBloc>().add(LoadUserProfile());
  context.read<HomeBloc>().add(LoadActivatedGoals());
  context.read<StatisticBloc>().add(LoadStatisticsEvent());
  context.read<StatisticBloc>().add(LoadPieDataEvent(1));
  context.read<TransactionBloc>().add(LoadRecentTransactions());
}
