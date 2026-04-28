import 'package:flutter/material.dart';

class IntroTwo extends StatelessWidget {
  const IntroTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFE0E7FF),
              shape: BoxShape.circle,
            ),
            child: Text("💰", style: TextStyle(fontSize: 100)),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFF3B82F6),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 6),
              Container(
                width: 22,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(width: 6),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFFE2E8F0),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Tejash odatini shakllantiring",
            style: TextStyle(
              fontSize: 28,
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w800,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Har kuni ozgina tejash — vaqt o'tishi bilan katta natijalarga olib keladi. Maqsadlaringizni belgilang.",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
