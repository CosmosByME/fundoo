import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';

class LogOutButton extends StatelessWidget {
  final void Function() onTap;
  const LogOutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF).withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, size: 16, color: Colors.white),
            SizedBox(width: 4),
            Text(
              context.l10n.logOut,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
