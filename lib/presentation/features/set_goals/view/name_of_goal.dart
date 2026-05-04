import 'package:flutter/material.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:fundoo/core/widget/recommended_goal_names.dart';
import 'package:fundoo/presentation/features/set_goals/module/inherited_goal.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/widget/custom_button.dart';

class NameOfGoal extends StatefulWidget {
  const NameOfGoal({super.key});

  @override
  State<NameOfGoal> createState() => _NameOfGoalState();
}

class _NameOfGoalState extends State<NameOfGoal> {
  late TextEditingController _goalNameController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _goalNameController = context.goal.goalNotifier.goalController;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                shape: BoxShape.circle,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.whatGoal,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                context.l10n.goalBody,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Wrap(
                children: [
                  RecommendedGoalNames(text: "🚗 Avtomobil", controller: _goalNameController),
                  const SizedBox(width: 10),
                  RecommendedGoalNames(text: "✈️ Sayohat", controller: _goalNameController),
                  const SizedBox(width: 10),
                  RecommendedGoalNames(text: "💼 Biznes", controller: _goalNameController),
                  const SizedBox(width: 10),
                  RecommendedGoalNames(text: "🏠 Uy", controller: _goalNameController),
                  const SizedBox(width: 10),
                  RecommendedGoalNames(text: "🎓 Ta'lim", controller: _goalNameController),
                  const SizedBox(width: 10),
                  RecommendedGoalNames(text: "📱 Gadjet", controller: _goalNameController),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(controller: _goalNameController, label: context.l10n.writeGoal,maxLength: 60, maxLines: 3,),
              const SizedBox(height: 35),
              CustomButton(
                onPressed: () {
                  context.goNamed('cost-of-goal');
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
