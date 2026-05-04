import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/save_purpose_card.dart';

class GoalCard extends StatelessWidget {
  final VoidCallback onAddMoney;
  final VoidCallback onEditPurpose;
  const GoalCard({super.key, required this.onAddMoney, required this.onEditPurpose});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF2563EB), Color(0xFF1D4ED8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.currentBalance,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            "390,500 so'm",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),

          SavePurposeCard(onEditPurpose: onEditPurpose),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: onAddMoney,
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
                  onPressed: () {},
                  backgroundColor: Color(0xFFF97316),
                  child: Text(
                    "- ${context.l10n.removeMoney}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
