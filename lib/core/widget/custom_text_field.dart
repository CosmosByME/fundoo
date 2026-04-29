import 'package:flutter/material.dart';


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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 53,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "00 000 00 00",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
    );
  }
}
