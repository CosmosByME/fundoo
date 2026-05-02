import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String icon;
  final String text;

  const InfoWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$icon   ",
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF1D4ED8),
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
