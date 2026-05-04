import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/analytic_section.dart';
import 'package:fundoo/core/widget/notification_icon.dart';
import 'package:fundoo/core/widget/statistic_showings.dart';
import 'package:go_router/go_router.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.analytics),
        actions: [
          NotificationIcon(
            hasNotifications: true,
            onTap: () {
              context.push('/notifications');
            },
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 16),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: AnalyticSection()),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: AllIncomeIndicator()),
                  SizedBox(width: 8),
                  Expanded(child: AllSpendingIndicator()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
