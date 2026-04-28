import 'package:flutter/material.dart';
import 'package:fundoo/core/services/svg_service.dart';

import '../../../../core/l10n/l10n.dart';

class AuthMainPage extends StatelessWidget {
  const AuthMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgService().logo(150, 150),
            const SizedBox(height: 20),
            Text(context.l10n.welcome),
            const SizedBox(height: 10),
            Text(context.l10n.welcomeBody),
          ],
        ),
      ),
    );
  }
}
