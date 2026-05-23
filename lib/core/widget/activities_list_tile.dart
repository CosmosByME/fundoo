import 'package:flutter/material.dart';
import 'package:fundoo/data/models/transaction.dart';

class ActivitiesListTile extends StatelessWidget {
  final IconData icon;
  final Transaction data;

  const ActivitiesListTile({super.key, required this.icon, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF3D4D66), size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.categoryName ?? data.manualCategoryName ?? 'Other',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E2A3C),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "${DateTime.now().difference(data.occurredAt).inDays} days ago",
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8A94A6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            data.transactionType == 3 || data.transactionType == 5
                ? "-${data.amount.toStringAsFixed(2)}"
                : "+${data.amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: data.transactionType != 3 && data.transactionType != 5
                  ? Colors.lightGreen
                  : Color(0xFFDC2626),
            ),
          ),
        ],
      ),
    );
  }
}
