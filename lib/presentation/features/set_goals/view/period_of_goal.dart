import 'package:flutter/material.dart';
import 'package:fundoo/core/widget/date_picking_field.dart';
import 'package:fundoo/core/widget/recommended_times.dart';
import 'package:fundoo/presentation/features/set_goals/module/inherited_goal.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/info_widget.dart';

class PeriodOfGoal extends StatefulWidget {
  const PeriodOfGoal({super.key});

  @override
  State<PeriodOfGoal> createState() => _PeriodOfGoalState();
}

class _PeriodOfGoalState extends State<PeriodOfGoal> {
  late TextEditingController _deadlineController;

  @override
  void initState() {
    super.initState();
    _deadlineController = TextEditingController();
    _deadlineController.addListener(() {
      setState(() {});
      if (_deadlineController.text.length == 10) {
        context.goal.goalNotifier.deadlineController = DateTime(
          int.parse(_deadlineController.text.substring(6, 10)),
          int.parse(_deadlineController.text.substring(3, 5)),
          int.parse(_deadlineController.text.substring(0, 2)),
        );
      }
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
                context.l10n.whenGoal,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                context.l10n.whenGoalBody,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  RecommendedTimes(
                    controller: _deadlineController,
                    monthRange: 3,
                  ),
                  RecommendedTimes(
                    controller: _deadlineController,
                    monthRange: 6,
                  ),
                  RecommendedTimes(
                    controller: _deadlineController,
                    monthRange: 12,
                  ),
                  RecommendedTimes(
                    controller: _deadlineController,
                    monthRange: 18,
                  ),
                  RecommendedTimes(
                    controller: _deadlineController,
                    monthRange: 24,
                  ),
                  RecommendedTimes(
                    controller: _deadlineController,
                    monthRange: 36,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              DatePickingField(
                context: context,
                controller: _deadlineController,
              ),
              const SizedBox(height: 20),
              InfoWidget(icon: "💡", text: context.l10n.dateInfo(110000)),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  context.goNamed('goal-summary');
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
      ),
    );
  }
}
