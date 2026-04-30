import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/otp_field.dart';
import 'package:go_router/go_router.dart';

class SmsVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const SmsVerificationPage({super.key, required this.phoneNumber});

  @override
  State<SmsVerificationPage> createState() => _SmsVerificationPageState();
}

class _SmsVerificationPageState extends State<SmsVerificationPage> {
  late String phoneNumber;
  int otp = 123;
  late final TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    phoneNumber = widget.phoneNumber;
    _codeController = TextEditingController();
    _codeController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.verification,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            SizedBox(height: 10),
            Text(
              context.l10n.verificationBody,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              phoneNumber,
              style: TextStyle(
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30),
            OtpField(controller: _codeController),
            const SizedBox(height: 35),
            CustomButton(
              onPressed: _codeController.text.length == 6
                  ? () {
                      context.go('/home');
                    }
                  : null,
              backgroundColor: Color(0xFF2563EB),
              child: Text(
                context.l10n.enter,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
