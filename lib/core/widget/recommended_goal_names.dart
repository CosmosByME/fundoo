import 'package:flutter/material.dart';

class RecommendedGoalNames extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const RecommendedGoalNames({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        controller.text = text.substring(2);
      },
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFF1F5F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF475569),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
