import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../bloc/profile_bloc/profile_bloc.dart';

class BioChangingPage extends StatefulWidget {
  const BioChangingPage({super.key});

  @override
  State<BioChangingPage> createState() => _BioChangingPageState();
}

class _BioChangingPageState extends State<BioChangingPage> {
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _bioController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ProfileBloc>().state;
    _bioController.setText(state.user?.bio ?? "");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.bio,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              context.l10n.bioBody,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            CustomTextField(
              hint: "Bio",
              controller: _bioController,
              label: context.l10n.bio,
              maxLines: 5,
              maxLength: 150,
            ),
            SizedBox(height: 16),

            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return CustomButton(
                  backgroundColor: const Color(0xFF2563EB),
                  child: state.isLoading
                      ? CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        )
                      : Text(
                          context.l10n.save,
                          style: TextStyle(color: Colors.white),
                        ),
                  onPressed: () {
                    context.read<ProfileBloc>().add(
                      UpdateUserProfile(
                        fullName: state.user?.fullname,
                        displayName: state.user?.displayName,
                        age: state.user?.age,
                        bio: _bioController.text.trim(),
                      ),
                    );
                    context.pop();
                    context.read<ProfileBloc>().add(
                        LoadUserProfile());
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
