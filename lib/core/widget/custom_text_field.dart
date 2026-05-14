import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final int? maxLength;
  final int? maxLines;
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
    this.maxLines, this.maxLength,
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
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF64748B),
            ),
          ),
        TextField(
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFFE2E8F0), width: 2),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
