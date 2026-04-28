import 'package:flutter/material.dart';
import 'package:fundoo/presentation/features/into/view/widgets/card3.dart';

import '../../../../core/l10n/l10n.dart';

class IntroThree extends StatelessWidget {
  const IntroThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: SizedBox()),
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
            context.l10n.intro3Header,
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
            context.l10n.intro3Body,
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
                IntroThreeCard(
                  icon: "📈",
                  main: context.l10n.intro3card1header,
                  text: context.l10n.intro3card1body,
                ),
                IntroThreeCard(
                  icon: "🎯",
                  main: context.l10n.intro3card2header,
                  text: context.l10n.intro3card2body,
                ),
                IntroThreeCard(
                  icon: "🎮",
                  main: context.l10n.intro3card3header,
                  text: context.l10n.intro3card3body,
                ),
                IntroThreeCard(
                  icon: "🔔",
                  main: context.l10n.intro3card4header,
                  text: context.l10n.intro3card4body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
