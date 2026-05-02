import 'package:flutter/material.dart';

class GoalNotifier extends ChangeNotifier {
  final TextEditingController goalController = TextEditingController();
  DateTime deadlineController = DateTime.now();
  final TextEditingController costController = TextEditingController();
  final TextEditingController currentBudgetController = TextEditingController();

}