import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final Color? sideColor;

  const CustomButton({
    super.key,
    this.onPressed,
    this.child,
    this.backgroundColor,
    this.sideColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: backgroundColor,
        minimumSize: Size(double.infinity, 50),
        backgroundColor: backgroundColor,
        side: sideColor != null ? BorderSide(color: sideColor!) : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: child,
    );
  }
}
