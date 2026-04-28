import 'package:flutter/material.dart';
import 'package:fundoo/presentation/features/into/view/widgets/card.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/services/svg_service.dart';

class IntroOne extends StatelessWidget {
  const IntroOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SvgService().logo(150, 150),
          Text(
            context.l10n.intro1Header,
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
            context.l10n.intro1Body,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          IntroOneCard(
            icon: "🎯",
            text: context.l10n.intro1card1
          ),
          SizedBox(height: 12),
          IntroOneCard(
            icon: "📊",
            text: context.l10n.intro1card2,
          ),
          SizedBox(height: 12),
          IntroOneCard(
            icon: "🏆",
            text: context.l10n.intro1card3,
          ),
        ],
      ),
    );
  }
}
