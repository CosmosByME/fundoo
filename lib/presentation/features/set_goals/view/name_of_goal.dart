import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/enter_number.dart';

class NameOfGoal extends StatefulWidget {
  const NameOfGoal({super.key});

  @override
  State<NameOfGoal> createState() => _NameOfGoalState();
}

class _NameOfGoalState extends State<NameOfGoal> {
  late final TextEditingController _goalNameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _goalNameController = TextEditingController();
  }

  @override
  void dispose() {
    _goalNameController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 22,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFF3B82F6),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 6),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFFE2E8F0),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 6),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(width: 6),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
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
            CustomTextField(controller: _goalNameController, label: "",),
            const SizedBox(height: 35),
            CustomButton(
              onPressed: () {

              },
              backgroundColor: Color(0xFF2563EB),
              child: Text(
                context.l10n.next,
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
                    onPressed: () {
                      context.go('/auth/sign-up');
                    },
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
