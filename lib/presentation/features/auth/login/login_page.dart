import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/enter_number.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.enter,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            SizedBox(height: 10),
            Text(
              context.l10n.enterPhone,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 30),
            EnterNumberField(
              controller: _phoneController,
            ),
            const SizedBox(height: 35),
            CustomButton(
              onPressed: () {
                context.go('/auth/log-in/otp/${_phoneController.text}');
              },
              backgroundColor: Color(0xFF2563EB),
              child: Text(
                context.l10n.sendCode,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.l10n.noAccount, style: TextStyle(color: Colors.grey),),
                  TextButton(
                    onPressed: () {},
                    child: Text(context.l10n.createAccount, style: TextStyle(color: Color(0xFF2563EB)),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
