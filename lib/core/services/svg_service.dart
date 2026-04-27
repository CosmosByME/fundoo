import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgService {
  Widget logo(double height, double width) {
    return SvgPicture.asset(
      "assets/images/fundoo_logo.svg",
      height: height,
      width: width,
    );
  }

  Widget moneyBag(double height, double width) {
    return SvgPicture.asset(
      "assets/images/money_bag.svg",
      height: height,
      width: width,
    );
  }
}
