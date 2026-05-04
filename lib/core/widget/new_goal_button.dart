import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';

class NewGoalButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NewGoalButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(16),
          strokeWidth: 2,
          dashPattern: [4, 4],
          color: Color(0xFF2563EB),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          decoration: BoxDecoration(
            color: Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              "+ ${context.l10n.addNewGoal}",
              style: TextStyle(
                color: Color(0xFF2563EB),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
