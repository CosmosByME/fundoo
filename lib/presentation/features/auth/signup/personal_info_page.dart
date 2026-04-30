import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _userNameController;
  late final TextEditingController _ageController;

  @override
  initState() {
    super.initState();
    _nameController = TextEditingController();
    _userNameController = TextEditingController();
    _ageController = TextEditingController();
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
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.personalInfo,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            SizedBox(height: 10),
            Text(
              context.l10n.askingInfo,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 30),
            CustomTextField(controller: _nameController, label: context.l10n.fullName, hint: "Lola Toirxonova",),
            SizedBox(height: 15),
            CustomTextField(controller: _userNameController, label: context.l10n.userName, hint: "@lola_toirxonova",),
            SizedBox(height: 15),
            CustomTextField(controller: _ageController, label: context.l10n.age, hint: "25", keyboardType: TextInputType.number),
            const SizedBox(height: 35),
            CustomButton(
              onPressed: () {
                context.go('/auth/sign-up/otp');
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
                  Text(
                    context.l10n.noAccount,
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      context.l10n.createAccount,
                      style: TextStyle(color: Color(0xFF2563EB)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
