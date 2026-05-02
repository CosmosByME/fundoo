import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/presentation/features/set_goals/module/inherited_goal.dart';
import 'package:go_router/go_router.dart';

class GoalSummary extends StatelessWidget {
  const GoalSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final goalNotifier = context.goal.goalNotifier;
    final now = DateTime.now();
    int months = (goalNotifier.deadlineController.year - now.year) * 12 + goalNotifier.deadlineController.month - now.month;
    if (months <= 0) months = 1;
    final cost = double.tryParse(goalNotifier.costController.text.replaceAll(' ', '')) ?? 0;
    final current = double.tryParse(goalNotifier.currentBudgetController.text.replaceAll(' ', '')) ?? 0;
    final monthly = ((cost - current) / months).toStringAsFixed(0);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D4ED8), Color(0xFF1E3A8A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 60),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF22C55E), Color(0xFF16A34A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF22C55E).withValues(alpha: 0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Text("✅", style: TextStyle(fontSize: 26)),
                ),
                const SizedBox(height: 30),
                Text(
                  context.l10n.planIsReady,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  context.l10n.planIsReadyBody,
                  style: TextStyle(color: const Color(0xFFFFFFFF).withValues(alpha: 0.65)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildRow(context.l10n.goal, goalNotifier.goalController.text),
                      const Divider(color: Colors.white24, height: 24),
                      _buildRow(context.l10n.goalSum, '${goalNotifier.costController.text} sum'),
                      const Divider(color: Colors.white24, height: 24),
                      _buildRow(context.l10n.currentBalance, '${goalNotifier.currentBudgetController.text} sum'),
                      const Divider(color: Colors.white24, height: 24),
                      _buildRow(context.l10n.duration, '$months ${context.l10n.month}'),
                      const Divider(color: Colors.white24, height: 24),
                      _buildRow(context.l10n.monthlySaving, '$monthly sum'),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButton(
                  backgroundColor: const Color(0xFFFFFFFF),
                  onPressed: (){
                    context.go('/main-page');
                  },
                  child: Text(
                    context.l10n.goToFundoo,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1D4ED8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
