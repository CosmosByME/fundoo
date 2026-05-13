import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/data/models/spending.dart';
import 'package:fundoo/core/widget/goal_card.dart';
import 'package:fundoo/core/widget/new_goal_button.dart';
import 'package:fundoo/core/widget/notification_icon.dart';
import 'package:fundoo/core/widget/spending_section.dart';
import 'package:fundoo/core/widget/spending_tile.dart';
import 'package:fundoo/presentation/home/bloc/home_bloc/home_bloc.dart';
import 'package:fundoo/presentation/home/view/other/show_goal_edit.dart';
import 'package:fundoo/presentation/home/view/other/show_income_adding.dart';
import 'package:go_router/go_router.dart';

import '../bloc/profile_bloc/profile_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<SpendingOrIncome> spendingTiles = [
    SpendingOrIncome(
      name: "Boshlang'ich ",
      amount: 100000,
      type: SpendingType.investment,
      date: "Bugun",
    ),
    SpendingOrIncome(
      name: "Oylik maosh",
      amount: 500000,
      type: SpendingType.income,
      date: "3-mart",
    ),
    SpendingOrIncome(
      name: "Oziq-ovqat",
      amount: -150000,
      type: SpendingType.spending,
      date: "2-mart",
    ),
    SpendingOrIncome(
      name: "Transport",
      amount: -50000,
      type: SpendingType.spending,
      date: "1-mart",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.controlPanel,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
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
      body: RefreshIndicator.adaptive(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            if (context.mounted) {
              context.read<ProfileBloc>().add(LoadUserProfile());
              context.read<HomeBloc>().add(LoadActivatedGoals());
            }
          });
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return GoalCard(
                    goals: state.activatedGoals ?? [],
                    onAddMoney: () {
                      openIncomeEditDialog(context);
                    },
                    onEditPurpose: () {
                      openGoalEditDialog(context);
                    },
                  );
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
              child: SpendingSection(
                onSeeAllPressed: () {
                  context.push('/recent-activity');
                },
                children: spendingTiles
                    .map(
                      (data) =>
                      SpendingTile(
                        data: data,
                        icon: data.type == SpendingType.income
                            ? Icons.arrow_upward
                            : data.type == SpendingType.spending
                            ? Icons.arrow_downward
                            : Icons.trending_up,
                      ),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
