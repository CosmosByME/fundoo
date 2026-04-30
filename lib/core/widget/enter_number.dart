import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../l10n/l10n.dart';

class EnterNumberField extends StatefulWidget {
  final TextEditingController _controller;

  const EnterNumberField({super.key, controller}) : _controller = controller;

  @override
  State<EnterNumberField> createState() => _EnterNumberFieldState();
}

class _EnterNumberFieldState extends State<EnterNumberField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget._controller;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final maskFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 53,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: Row(
            children: [
              SizedBox(width: 15),
              Text(
                ' +998',
                style: TextStyle(fontSize: 16, color: Color(0xFF0F172A)),
              ),
              SizedBox(width: 10),
              Container(
                width: 2,
                height: double.infinity,
                color: Colors.grey.shade300,
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "00 000 00 00",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  inputFormatters: [maskFormatter],
                ),
              ),
            ],
          ),
        ),
        Text(
          context.l10n.onlyUzb,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
