import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:fundoo/data/models/goal.dart';

import '../../bloc/home_bloc/home_bloc.dart';

void openGoalEditDialog(BuildContext context, Goal goal) {
  TextEditingController sum = TextEditingController(
    text: goal.targetAmount.toString(),
  );
  TextEditingController name = TextEditingController(text: goal.name);
  TextEditingController date = TextEditingController(
    text: (goal.plannedMonths ?? goal.targetDate!).toString(),
  );
  showModalBottomSheet(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    context: context,
    useRootNavigator: true,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.editGoal,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 10),
            Text(
              context.l10n.addIncomeBody,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            CustomTextField(controller: name, label: context.l10n.goal),
            SizedBox(height: 16),
            CustomTextField(
              controller: sum,
              keyboardType: TextInputType.number,
              label: context.l10n.goalSum,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: date,
              keyboardType: TextInputType.datetime,
              label: context.l10n.duration,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Color(0xFFF1F5F9),
                    child: Text(
                      context.l10n.cancel,
                      style: TextStyle(color: Color(0xFF334155)),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(
                        EditActivatedGoal(
                          goalId: goal.id!,
                          name: name.text,
                          targetAmount: double.tryParse(sum.text) ?? 0,
                          plannedMonths: goal.plannedMonths != null
                              ? int.tryParse(date.text)
                              : null,
                          targetDate: goal.targetDate != null ? date.text: null,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    backgroundColor: Color(0xFF2563EB),
                    child: Text(
                      context.l10n.save,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
