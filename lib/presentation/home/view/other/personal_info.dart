import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/button_loading_indicator.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../bloc/profile_bloc/profile_bloc.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  late TextEditingController _nameController;
  late TextEditingController _userNameController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _userNameController = TextEditingController();
    _ageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ProfileBloc>().state;
    _nameController.setText(state.user?.fullname ?? "");
    _userNameController.setText(state.user?.displayName ?? "");
    _ageController.setText(
      state.user?.age != null ? state.user!.age.toString() : "",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.personalInfo,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _nameController,
              label: context.l10n.fullName,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _userNameController,
              label: context.l10n.userName,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _ageController,
              label: context.l10n.age,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 32),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return CustomButton(
                  backgroundColor: const Color(0xFF2563EB),
                  child: state.isLoading
                      ? const ButtonLoadingIndicator()
                      : Text(
                          context.l10n.save,
                          style: TextStyle(color: Colors.white),
                        ),
                  onPressed: () {
                    context.read<ProfileBloc>().add(
                      UpdateUserProfile(
                        displayName: _userNameController.text,
                        fullName: _nameController.text,
                        age: int.tryParse(_ageController.text),
                        bio: state.user?.bio,
                      ),
                    );
                    context.pop();
                    context.read<ProfileBloc>().add(LoadUserProfile());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
