import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/models/spending.dart';
import 'package:fundoo/core/widget/activities_list_tile.dart';

class AllActivities extends StatefulWidget {
  const AllActivities({super.key});

  @override
  State<AllActivities> createState() => _AllActivitiesState();
}

class _AllActivitiesState extends State<AllActivities> {
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
          context.l10n.recentActivity,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: ListView.separated(
          itemCount: spendingTiles.length,
          itemBuilder: (context, index) {
            return ActivitiesListTile(
              icon: spendingTiles[index].type == SpendingType.income
                  ? Icons.arrow_upward
                  : spendingTiles[index].type == SpendingType.spending
                  ? Icons.arrow_downward
                  : Icons.trending_up,
              data: spendingTiles[index],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 16);
          },
        ),
      ),
    );
  }
}
