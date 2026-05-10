import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';

class RecommendedTimes extends StatelessWidget {
  final bool isSelected;
  final int monthRange;
  final void Function(int) ontap;

  const RecommendedTimes({
    required this.isSelected,
    super.key,
    required this.monthRange,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap(monthRange);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFEFF6FF) : Colors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: isSelected ? Color(0xFF1D4ED8) : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$monthRange",
              style: TextStyle(
                fontSize: 20,
                color: isSelected ? Color(0xFF1D4ED8) : Colors.grey.shade500,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 15),
            Text(
              context.l10n.month,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? Color(0xFF1D4ED8) : Colors.grey.shade500,
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
