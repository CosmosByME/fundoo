import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';

class AnalyticSection extends StatelessWidget {
  const AnalyticSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF14213D).withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16.0, bottom: 8, top: 16),
              child: Text(
                context.l10n.thisMonthAnalytic,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ),
            ...[
              AnalyticsTile(
                name: context.l10n.allIncome,
                trailing: Text(
                  "+650,000 so'm",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightGreen,
                  ),
                ),
              ),
              AnalyticsTile(
                name: context.l10n.allSpending,
                trailing: Text(
                  "-250,000 so'm",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
              ),
              AnalyticsTile(
                name: context.l10n.savingDegree,
                trailing: Text(
                  "61%",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class AnalyticsTile extends StatelessWidget {
  final String name;
  final Widget trailing;
  const AnalyticsTile({super.key, required this.name, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF0F2F7), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF475569),
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
