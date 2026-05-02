import 'package:flutter/material.dart';


class GoalMoneyBanner extends StatelessWidget {
  final String title;
  final String money;
  final Color color;
  final Color textColor;
  final Color borderColor;

  const GoalMoneyBanner({
    super.key,
    required this.title,
    required this.money,
    required this.color,
    required this.textColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                money,
                style: TextStyle(
                  fontSize: 26,
                  color: textColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                ' UZS',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
