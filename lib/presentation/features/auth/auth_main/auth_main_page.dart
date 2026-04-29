import 'package:flutter/material.dart';
import 'package:fundoo/core/services/svg_service.dart';
import 'package:go_router/go_router.dart';

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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('/auth/sign-in');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2563EB),
              ),
              child: Text(
                context.l10n.createAccount,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('/auth/sign-up');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFFFFF),
                side: BorderSide(color: Color(0xFF2563EB)),
              ),
              child: Text(
                context.l10n.logIn,
                style: TextStyle(
                  color: Color(0xFF2563EB),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
