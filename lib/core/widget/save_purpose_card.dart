import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/data/models/goal.dart';
import 'package:fundoo/presentation/home/view/other/delete_confirmation.dart';
import 'package:fundoo/presentation/home/view/other/show_charge_adding.dart';
import 'package:fundoo/presentation/home/view/other/show_goal_edit.dart';

import '../../presentation/home/bloc/home_bloc/home_bloc.dart';
import '../../presentation/home/view/other/show_income_adding.dart';
import 'custom_button.dart';

class SavePurposeCard extends StatelessWidget {
  final Goal goal;

  const SavePurposeCard({
    super.key,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    final int daysLeft;

    if(goal.targetDate != null) {
      final targetDate = DateTime.parse(goal.targetDate!);
      final currentDate = DateTime.now();
      daysLeft = targetDate.difference(currentDate).inDays;
    } else {
      final plannedMonths = goal.plannedMonths ?? 0;
      final currentDate = DateTime.now();
      final targetDate = currentDate.add(Duration(days: plannedMonths * 30));
      daysLeft = targetDate.difference(currentDate).inDays;
    }


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.l10n.savingPurpose,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            openGoalEditDialog(context, goal);
                          },
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () async {
                            final response = await showDeleteConfirmationDialog(context);
                            if (response && context.mounted) {
                              context.read<HomeBloc>().add(DeleteActivatedGoal(goalId: goal.id!));
                            }
                          },
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Icon(
                              Icons.delete,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                goal.name!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(3),
                value: goal.progressPercent!/100,
                backgroundColor: Colors.white.withValues(alpha: 0.18),
                color: Color(0xFF22C55E),
              ),

              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${(goal.currentSavedAmount ?? 0).toStringAsFixed(0)} / ${(goal.targetAmount ?? 0).toStringAsFixed(0)} so'm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    context.l10n.daysLeft(daysLeft),
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () async {
                  openIncomeAddDialog(context, goal.id!);
                },
                backgroundColor: Color(0xFF22C55E),
                child: Text(
                  "+ ${context.l10n.addMoney}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  openChargeEditDialog(context, goal.id!);
                },
                backgroundColor: Color(0xFFF97316),
                child: Text(
                  "- ${context.l10n.removeMoney}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: const Divider(
            color: Colors.white,
            thickness: 0.5,
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
