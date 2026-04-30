import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController _controller;

  const CustomTextField({
    super.key,
    this.hint,
    this.label,
    this.keyboardType,
    required controller,
  }) : _controller = controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController controller;
  late String? hint;
  late String? label;
  late TextInputType? keyboardType;

  @override
  void initState() {
    controller = widget._controller;
    hint = widget.hint;
    label = widget.label;
    keyboardType = widget.keyboardType;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
        Container(
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
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
