import 'package:flutter/material.dart';
import 'package:fundoo/presentation/features/splash/view/widggets/card.dart';

import '../../../../core/services/svg_service.dart';

class SplashOne extends StatelessWidget {
  const SplashOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SvgService().logo(150, 150),
          Text(
            "Moliyaviy erkinlikka qadam qo'ying",
            style: TextStyle(
              fontSize: 28,
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w800,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            "Fundoo — orzularingizni real moliyaviy maqsadlarga aylantiruvchi aqlli hamroh.",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          SplashOneCard(
            icon: "🎯",
            text: "Shaxsiy moliyaviy maqsadlar belgilang va kuzating",
          ),
          SizedBox(height: 12),
          SplashOneCard(
            icon: "📊",
            text: "Daromad va xarajatlaringizni tahlil qiling",
          ),
          SizedBox(height: 12),
          SplashOneCard(
            icon: "🏆",
            text: "Moliyaviy savodxonligingizni oshiring",
          ),
        ],
      ),
    );
  }
}
