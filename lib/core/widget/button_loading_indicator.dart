import 'package:flutter/material.dart';

class ButtonLoadingIndicator extends StatelessWidget {
  final Color color;

  const ButtonLoadingIndicator({super.key, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 20,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: color,
      ),
    );
  }
}
