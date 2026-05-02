import 'package:flutter/material.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:fundoo/core/widget/goal_money_banner.dart';
import 'package:fundoo/presentation/features/set_goals/module/inherited_goal.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/widget/custom_button.dart';

class CostOfGoal extends StatefulWidget {
  const CostOfGoal({super.key});

  @override
  State<CostOfGoal> createState() => _CostOfGoalState();
}

class _CostOfGoalState extends State<CostOfGoal> {
  late TextEditingController _costOfGoalController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _costOfGoalController = context.goal.goalNotifier.costController;
    _costOfGoalController.addListener(() {
      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFF3B82F6),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 22,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFF3B82F6),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.howMuch,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              context.l10n.howMuchBody,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            GoalMoneyBanner(
              title: context.l10n.goalSum,
              money: _costOfGoalController.text,
              color: Color(0xFFDBEAFE),
              textColor: Color(0xFF1D4ED8),
              borderColor: Color(0xFF2563EB).withValues(alpha: 0.1),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _costOfGoalController,
              label: context.l10n.amount,
              keyboardType: TextInputType.numberWithOptions(),
            ),
            const SizedBox(height: 35),
            CustomButton(
              onPressed: () {
                context.goNamed('current-budget');
              },
              backgroundColor: Color(0xFF2563EB),
              child: Text(
                context.l10n.continuing,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
