import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/goal_card.dart';
import 'package:fundoo/core/widget/new_goal_button.dart';
import 'package:fundoo/core/widget/notification_icon.dart';
import 'package:fundoo/core/widget/spending_section.dart';
import 'package:fundoo/core/widget/spending_tile.dart';
import 'package:fundoo/presentation/home/bloc/home_bloc/home_bloc.dart';
import 'package:fundoo/presentation/home/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.controlPanel,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        actionsPadding: EdgeInsets.only(right: 16),
        actions: [
          NotificationIcon(
            hasNotifications: true,
            onTap: () {
              context.push('/notifications');
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return GoalCard(goals: state.activatedGoals ?? []);
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NewGoalButton(
                onPressed: () {
                  context.push('/name-of-goal');
                },
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                return SpendingSection(
                  onSeeAllPressed: () {
                    context.read<TransactionBloc>().add(
                      RefreshTransactionsEvent(),
                    );
                    context.read<TransactionBloc>().add(
                      LoadTransactionsEvent(
                        state.page,
                      ),
                    );
                    context.push('/recent-activity');
                  },
                  children: state.recentTransactions != null
                      ? state.recentTransactions!
                            .map(
                              (data) => SpendingTile(
                                data: data,
                                icon: data.transactionType == 4
                                    ? Icons.arrow_upward
                                    : data.transactionType == 3
                                    ? Icons.arrow_downward
                                    : Icons.trending_up,
                              ),
                            )
                            .toList()
                      : [
                          Center(
                            child: Text(
                              "No recent transactions",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
