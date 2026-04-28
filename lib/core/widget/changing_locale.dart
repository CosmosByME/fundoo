import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';

Future<Locale?> localeSelectingDialog(BuildContext context) async {
  return await showModalBottomSheet<Locale>(
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.language,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              context.l10n.app_language,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            SizedBox(height: 12),
            ListTile(
              title: Text("English"),
              onTap: () => Navigator.pop(context, Locale('en')),
            ),
            ListTile(
              title: Text("Uzbek"),
              onTap: () => Navigator.pop(context, Locale('uz')),
            ),
            ListTile(
              title: Text("Russian"),
              onTap: () => Navigator.pop(context, Locale('ru')),
            ),
            SizedBox(height: 12),
          ],
        ),
      );
    },
  );
}
