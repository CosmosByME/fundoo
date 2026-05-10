import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  late TextEditingController _nameController;
  late TextEditingController _userNameController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "Alisher Abdullayev");
    _userNameController = TextEditingController(text: "@alisher_99");
    _ageController = TextEditingController(text: "25");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.personalInfo,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _nameController,
              label: context.l10n.fullName,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _userNameController,
              label: context.l10n.userName,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _ageController,
              label: context.l10n.age,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 32),
            CustomButton(
              backgroundColor: const Color(0xFF2563EB),
              child: Text(
                context.l10n.save,
                style: TextStyle(color: Colors.white),
              ),
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
