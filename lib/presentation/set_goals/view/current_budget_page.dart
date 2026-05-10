import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:fundoo/core/widget/goal_money_banner.dart';
import 'package:fundoo/presentation/set_goals/bloc/set_goal_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/info_widget.dart';

class CurrentBudgetPage extends StatefulWidget {
  const CurrentBudgetPage({super.key});

  @override
  State<CurrentBudgetPage> createState() => _CurrentBudgetPageState();
}

class _CurrentBudgetPageState extends State<CurrentBudgetPage> {
  late TextEditingController _currentBudgetController;

  @override
  void initState() {
    super.initState();
    _currentBudgetController = TextEditingController();
    _currentBudgetController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFF3B82F6),
                borderRadius: BorderRadius.circular(4),
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.howMuchYouHave,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                context.l10n.howMuchYouHaveBody,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              GoalMoneyBanner(
                title: context.l10n.currentBalance,
                money: _currentBudgetController.text,
                color: Color(0xFFDCFCE7),
                textColor: Color(0xFF16A34A),
                borderColor: Color(0xFF16A34A).withValues(alpha: 0.12),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _currentBudgetController,
                label: context.l10n.currentAmount,
                keyboardType: TextInputType.numberWithOptions(),
              ),
              const SizedBox(height: 20),
              InfoWidget(icon: "ℹ️", text: context.l10n.balanceChangingInfo),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: _currentBudgetController.text.isNotEmpty
                    ? () {
                        context.read<SetGoalBloc>().add(
                          SetGoalSavedAmountChanged(
                            double.parse(_currentBudgetController.text),
                          ),
                        );
                        context.pushNamed('period-of-goal');
                      }
                    : null,
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
      ),
    );
  }
}
