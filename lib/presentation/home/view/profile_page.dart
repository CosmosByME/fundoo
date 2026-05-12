import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/l10n/l10n_inherited.dart';
import 'package:fundoo/core/services/preferences_service.dart';
import 'package:fundoo/core/theme/inherited_theme.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
import 'package:fundoo/core/widget/action_tile.dart';
import 'package:fundoo/core/widget/log_out_button.dart';
import 'package:fundoo/core/widget/profile_header.dart';
import 'package:fundoo/core/widget/selection_card.dart';
import 'package:fundoo/core/widget/toggle_tile.dart';
import 'package:fundoo/presentation/home/view/other/default_waiting_page.dart';
import 'package:fundoo/presentation/home/view/other/delete_account_dialog.dart';
import 'package:fundoo/presentation/into/notifier/inherited_intro.dart';
import 'package:go_router/go_router.dart';

import '../bloc/profile_bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late FToast ftoast;
  bool _darkMode = false;
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    ftoast = FToast();
    ftoast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          //Claude, Can I add here an event which will download the user data, if the user in state is null?

          if (state.user != null) {
            setState(() {
            });
          }

          if (state.errorMessage != null) {
            showErrorToast(ftoast, state.errorMessage!);
          }
        },
        builder: (context, state) {
          if (state.user == null || state.isLoading) {
            return DefaultWaitingPage();
          } else {
            return CustomScrollView(
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
                    LogOutButton(
                      onTap: () async {
                        await PreferencesService.clearTokens();
                        if (context.mounted) {
                          context.go('/auth');
                        }
                      },
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
                      child: SafeArea(bottom: false, child: ProfileHeader(user: state.user!,)),
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
                              onTap: () {
                                context.push('/personal-info-changing');
                              },
                            ),
                            ActionTile(
                              icon: Icons.phone_iphone_outlined,
                              title: 'Telefon raqami',
                              subtitle: state.user!.phoneNumber ?? "-",
                              onTap: () {
                                context.push('/phone-changing');
                              },
                            ),
                            ActionTile(
                              icon: Icons.cake_outlined,
                              title: 'Bio',
                              subtitle: 'O\'zingiz haqida yozing',
                              onTap: () {
                                context.push('/bio');
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        SectionCard(
                          children: [
                            ToggleTile(
                              icon: Icons.nightlight_outlined,
                              title: 'Qorong\'i rejim',
                              value: _darkMode,
                              onChanged: (value) {
                                setState(() {
                                  _darkMode = value;
                                  context.themeMode.value = value
                                      ? ThemeMode.dark
                                      : ThemeMode.light;
                                  PreferencesService.setDarkMode(value);
                                });
                              },
                            ),
                            ToggleTile(
                              icon: Icons.notifications_none_rounded,
                              title: 'Bildirishnomalar',
                              subtitle: 'Push xabarnomalar',
                              value: _notificationsEnabled,
                              onChanged: (value) {
                                setState(() {
                                  _notificationsEnabled = value;
                                });
                              },
                            ),
                            ActionTile(
                              icon: Icons.language_outlined,
                              title: 'Til',
                              subtitle:
                                  context.locale.value == const Locale('uz')
                                  ? 'O\'zbekcha'
                                  : context.locale.value == const Locale('ru')
                                  ? 'Русский'
                                  : 'English',
                              onTap: () {
                                final state = InheritedIntro.of(
                                  context,
                                ).notifier;

                                state.changeLanguage(context);
                              },
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
                              mainColor: Color(0xFFDC2626),
                              icon: Icons.delete,
                              title: context.l10n.deleteAccount,
                              subtitle: context.l10n.deleteAccountBody,
                              onTap: () async {
                                final result = await showDeleteAccountDialog(context);
                                if (result == true && context.mounted) {
                                  context.read<ProfileBloc>().add(DeleteUserAccount());
                                  context.go('/auth');
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
