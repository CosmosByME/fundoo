import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  final TextEditingController? controller;
  const OtpField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final base = PinTheme(
      width: 48,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF8FAFC),
        border: Border.all(color: Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focused = base.copyDecorationWith(
      border: Border.all(color: Color(0xFF2563EB)),
      borderRadius: BorderRadius.circular(8),
    );

    final submitted = base.copyWith(
      decoration: base.decoration?.copyWith(
        color: Color(0xFFE2F8F0),
      ),
    );

    return Pinput(
      controller: controller,
      length: 6,
      defaultPinTheme: base,
      focusedPinTheme: focused,
      submittedPinTheme: submitted,
      autofocus: true,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      followingPinTheme: base,
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (index) => SizedBox(width: 8),
      );
  }
}
