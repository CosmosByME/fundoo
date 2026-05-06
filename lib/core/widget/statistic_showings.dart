import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';

class AllIncomeIndicator extends StatelessWidget {
  const AllIncomeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100, //double.infinity,
      // height: 100, // double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF0FDF4),
            Color(0xFFDCFCE7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Color(0xFF16A34A).withValues(alpha: 0.15)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.allIncome,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF16A34A),
            ),
          ),
          Text(
            "650,000",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF15803D),
            ),
          ),
          Text(
            "so'm",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF15803D),
            ),
          ),
        ],
      ),
    );
  }
}

class AllSpendingIndicator extends StatelessWidget {
  const AllSpendingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100, // double.infinity,
      // height: 100, //double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFEF2F2),
            Color(0xFFFEE2E2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Color(0xFFDC2626).withValues(alpha: 0.15)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.allSpending,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFFDC2626),
            ),
          ),
          Text(
            "250,000",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFFB91C1C),
            ),
          ),
          Text(
            "so'm",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFFB91C1C),
            ),
          ),
        ],
      ),
    );
  }
}
