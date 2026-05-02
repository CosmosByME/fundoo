import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DatePickingField extends StatefulWidget {
  final BuildContext context;
  final TextEditingController controller;
  const DatePickingField({super.key, required this.context, required this.controller});

  @override
  State<DatePickingField> createState() => _DatePickingFieldState();
}

class _DatePickingFieldState extends State<DatePickingField> {

  final maskFormatter = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: TextField(
              controller: widget.controller,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'DD.MM.YYYY',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
              inputFormatters: [maskFormatter],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: IconButton(icon: Icon(Icons.calendar_month), onPressed: () {
                showDatePicker(
                  context: widget.context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                ).then((pickedDate) {
                  if (pickedDate != null) {
                    String formattedDate = "${pickedDate.day.toString().padLeft(2, '0')}.${pickedDate.month.toString().padLeft(2, '0')}.${pickedDate.year}";
                    widget.controller.text = formattedDate;
                  }
                });
            },),
          ),
        ],
      ),
    );
  }
}
