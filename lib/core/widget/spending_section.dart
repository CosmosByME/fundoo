import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';

class SpendingSection extends StatelessWidget {
  final void Function()? onSeeAllPressed;
  final List<Widget> children;
  const SpendingSection({
    super.key,
    required this.children,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.recentActivity,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  TextButton(
                    onPressed: onSeeAllPressed,
                    child: Text(
                      context.l10n.seeAll,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
