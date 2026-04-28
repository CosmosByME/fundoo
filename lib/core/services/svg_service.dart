import 'package:flutter/material.dart';

class SvgService {
  Widget logo(double height, double width) {
    return Image.asset(
      "assets/images/logo.png",
      height: height,
      width: width,
    );
  }

}
