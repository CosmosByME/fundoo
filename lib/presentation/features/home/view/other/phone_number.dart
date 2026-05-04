import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/enter_number.dart';

class PhoneChangingPage extends StatefulWidget {
  const PhoneChangingPage({super.key});

  @override
  State<PhoneChangingPage> createState() => _PhoneChangingPageState();
}

class _PhoneChangingPageState extends State<PhoneChangingPage> {
  late TextEditingController _oldPhoneController;
  late TextEditingController _newPhoneController;

  @override
  void initState() {
    super.initState();
    _oldPhoneController = TextEditingController();
    _newPhoneController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPhoneController.dispose();
    _newPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.phoneNumber,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              context.l10n.phoneChangingBody,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            EnterNumberField(
              controller: _oldPhoneController,
              label: context.l10n.currentPhone,
            ),
            SizedBox(height: 16),
            EnterNumberField(
              controller: _newPhoneController,
              label: context.l10n.newPhone,
            ),
            SizedBox(height: 16),
            
            CustomButton(
              backgroundColor: const Color(0xFF2563EB),
              child: Text(context.l10n.sendCode, style: TextStyle(color: Colors.white)),
              onPressed: () {
                // Save logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
