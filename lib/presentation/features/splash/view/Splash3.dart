import 'package:flutter/material.dart';
import 'package:fundoo/presentation/features/splash/view/widggets/card.dart';
import 'package:fundoo/presentation/features/splash/view/widggets/card3.dart';

import '../../../../core/services/svg_service.dart';

class SplashThree extends StatelessWidget {
  const SplashThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1,child: SizedBox()),
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
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Sizni nima kutadi?",
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
            "Fundoo bilan moliyaviy hayotingizni to'liq nazorat qiling",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Expanded(
            flex: 2,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.7,
              ),
              children: [
                SplashThreeCard(
                  icon: "📈",
                  main: "Tahlil",
                  text: "Xarajat va daromad taqsimoti",
                ),
                SplashThreeCard(
                  icon: "🎯",
                  main: "Maqsadlar",
                  text: "Aniq reja bilan oldinga boring",
                ),
                SplashThreeCard(
                  icon: "🎮",
                  main: "O'yinlar",
                  text: "O'yin orqali moliya o'rganing",
                ),
                SplashThreeCard(
                  icon: "🔔",
                  main: "Eslatmalar",
                  text: "Maqsad signallari",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
