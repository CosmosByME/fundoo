import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/bnb_icon.dart';

class CustomBnb extends StatelessWidget {
  final void Function(int) onTap;
  final int currentIndex;
  const CustomBnb({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          currentIndex == 0
              ? Expanded(
                  child: BnbIconSelected(
                    icon: Icons.grid_view,
                    label: context.l10n.main,
                    index: 0,
                    onTap: onTap,
                  ),
                )
              : Expanded(
                  child: BnbIconUnselected(
                    icon: Icons.grid_view,
                    label: context.l10n.main,
                    index: 0,
                    onTap: onTap,
                  ),
                ),
          currentIndex == 1
              ? Expanded(
                  child: BnbIconSelected(
                    icon: Icons.bar_chart,
                    label: context.l10n.analytics,
                    index: 1,
                    onTap: onTap,
                  ),
                )
              : Expanded(
                  child: BnbIconUnselected(
                    icon: Icons.bar_chart,
                    label: context.l10n.analytics,
                    index: 1,
                    onTap: onTap,
                  ),
                ),
          currentIndex == 2
              ? Expanded(
                  child: BnbIconSelected(
                    icon: Icons.videogame_asset,
                    label: context.l10n.game,
                    index: 2,
                    onTap: onTap,
                  ),
                )
              : Expanded(
                  child: BnbIconUnselected(
                    icon: Icons.videogame_asset,
                    label: context.l10n.game,
                    index: 2,
                    onTap: onTap,
                  ),
                ),
          currentIndex == 3
              ? Expanded(
                  child: BnbIconSelected(
                    icon: Icons.person,
                    label: context.l10n.profile,
                    index: 3,
                    onTap: onTap,
                  ),
                )
              : Expanded(
                  child: BnbIconUnselected(
                    icon: Icons.person,
                    label: context.l10n.profile,
                    index: 3,
                    onTap: onTap,
                  ),
                ),
        ],
      ),
    );
  }
}
