import 'package:flutter/material.dart';
import 'package:fundoo/core/services/svg_service.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/l10n.dart';

class AuthMainPage extends StatelessWidget {
  const AuthMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgService().logo(150, 150),
              const SizedBox(height: 20),
              Text(context.l10n.welcome, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),),
              const SizedBox(height: 10),
              Text(context.l10n.welcomeBody, style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  context.go('/auth/sign-up');
                },
                backgroundColor: Color(0xFF2563EB),
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
              CustomButton(
                onPressed: () {
                  context.go('/auth/log-in');
                },
                backgroundColor: Color(0xFFFFFFFF),
                sideColor: Color(0xFF2563EB),
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
      ),
    );
  }
}
