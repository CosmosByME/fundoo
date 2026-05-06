import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';

void openIncomeEditDialog(BuildContext context) {
  TextEditingController sum = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController purpose = TextEditingController();
  showModalBottomSheet(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.addIncome,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 10),
            Text(
              context.l10n.addIncomeBody,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: sum,
              keyboardType: TextInputType.number,
              label: context.l10n.incomeAmount,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: date,
              keyboardType: TextInputType.datetime,
              label: context.l10n.incomeDate,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: purpose,
              label: context.l10n.incomeNotes,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      // Maqsadni saqlash logikasi
                      Navigator.pop(context);
                    },
                    backgroundColor: Color(0xFFF1F5F9),
                    child: Text(
                      context.l10n.cancel,
                      style: TextStyle(color: Color(0xFF334155)),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Color(0xFF22C55E),
                    child: Text(
                      context.l10n.save,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
