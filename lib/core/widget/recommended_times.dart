import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';

class RecommendedTimes extends StatelessWidget {
  final int monthRange;
  final TextEditingController controller;

  const RecommendedTimes({
    super.key,
    required this.controller,
    required this.monthRange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DateTime oldDate = DateTime.now();
        DateTime newDate = oldDate.add(Duration(days: monthRange*30));
        controller.text = "${newDate.day.toString().padLeft(2, '0')}.${newDate.month.toString().padLeft(2, '0')}.${newDate.year}";
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: Colors.grey.shade300, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$monthRange",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 15),
            Text(
              context.l10n.month,
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFF1D4ED8),
                fontWeight: FontWeight.w500,
              ),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
