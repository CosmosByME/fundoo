import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/l10n/l10n_inherited.dart';
import '../../../../core/services/preferences_service.dart';
import '../../../../core/widget/action_tile.dart';
import '../../../../core/widget/log_out_button.dart';
import '../../../../core/widget/profile_header.dart';
import '../../../../core/widget/selection_card.dart';
import '../../../../core/widget/toggle_tile.dart';
import '../../../../data/models/user.dart';

class DefaultWaitingPage extends StatelessWidget {
  const DefaultWaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF2563EB),
            surfaceTintColor: Colors.transparent,
            pinned: true,
            stretch: true,
            elevation: 0,
            toolbarHeight: 72,
            expandedHeight: 200,
            automaticallyImplyLeading: false,
            titleSpacing: 20,
            title: Text(
              context.l10n.profile,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
            actions: [
              Skeleton.keep(
                child: LogOutButton(
                  onTap: () async {
                    await PreferencesService.clearTokens();
                    if (context.mounted) {
                      context.go('/auth');
                    }
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF2F6BFF), Color(0xFF2A57E8)],
                  ),
                ),
                child: SafeArea(bottom: false, child: ProfileHeader(
                  user: User(
                    displayName: 'John Doe',
                    fullname: 'Johnathan Doe',
                    age: 30,
                    bio: 'Flutter developer and tech enthusiast.',
                    lastLoginAt: DateTime.now(),
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now()
                  ),
                )),
              ),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
                StretchMode.blurBackground,
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, 18),
              child: Column(
                children: [
                  SectionCard(
                    children: [
                      ActionTile(
                        icon: Icons.person_outline,
                        title: 'Shaxsiy ma\'lumotlar',
                        subtitle: 'Ism, yosh, foydalanuvchi nomi',
                        onTap: () {},
                      ),
                      ActionTile(
                        icon: Icons.phone_iphone_outlined,
                        title: 'Telefon raqami',
                        subtitle: '+998 90 123 45 67',
                        onTap: () {},
                      ),
                      ActionTile(
                        icon: Icons.cake_outlined,
                        title: 'Bio',
                        subtitle: 'O\'zingiz haqida yozing',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SectionCard(
                    children: [
                      ToggleTile(
                        icon: Icons.nightlight_outlined,
                        title: 'Qorong\'i rejim',
                        value: false,
                        onChanged: (value) {},
                      ),
                      ToggleTile(
                        icon: Icons.notifications_none_rounded,
                        title: 'Bildirishnomalar',
                        subtitle: 'Push xabarnomalar',
                        value: true,
                        onChanged: (value) {},
                      ),
                      ActionTile(
                        icon: Icons.language_outlined,
                        title: 'Til',
                        subtitle: context.locale.value == const Locale('uz')
                            ? 'O\'zbekcha'
                            : context.locale.value == const Locale('ru')
                            ? 'Русский'
                            : 'English',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SectionCard(
                    children: [
                      ActionTile(
                        icon: Icons.quiz_outlined,
                        title: 'Ko\'p beriladigan savollar',
                        subtitle: 'FAQ bo\'limi',
                        onTap: () {},
                      ),
                      ActionTile(
                        icon: Icons.support_agent_outlined,
                        title: 'Qo\'llab-quvvatlash',
                        subtitle: 'Muammo yoki savol bormi?',
                        onTap: () {},
                      ),
                      ActionTile(
                        icon: Icons.info_outline,
                        title: 'Ilova haqida',
                        subtitle: 'Fundoo v1.0.0',
                        trailing: const Text(
                          '1.0.0',
                          style: TextStyle(
                            color: Color(0xFF8A94A6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SectionCard(
                    children: [
                      ActionTile(
                        icon: Icons.delete,
                        title: context.l10n.deleteAccount,
                        subtitle: context.l10n.deleteAccountBody,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
