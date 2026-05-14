import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/presentation/auth/widgets/enter_number.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/profile_bloc/profile_bloc.dart';

class PhoneChangingPage extends StatefulWidget {
  const PhoneChangingPage({super.key});

  @override
  State<PhoneChangingPage> createState() => _PhoneChangingPageState();
}

class _PhoneChangingPageState extends State<PhoneChangingPage> {
  late FToast toast;
  late TextEditingController _oldPhoneController;
  late TextEditingController _newPhoneController;

  @override
  void initState() {
    super.initState();
    _oldPhoneController = TextEditingController();
    _newPhoneController = TextEditingController();
    toast = FToast();
    toast.init(context);
  }

  @override
  void dispose() {
    _oldPhoneController.dispose();
    _newPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          showErrorToast(toast, state.errorMessage!);
        }

        if (state.newPhoneNumber != null && context.mounted) {
          context.push('/change-number-otp');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.phoneNumber,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                context.l10n.phoneChangingBody,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              EnterNumberField(
                controller: _oldPhoneController,
                label: context.l10n.currentPhone,
              ),
              SizedBox(height: 16),
              EnterNumberField(
                controller: _newPhoneController,
                label: context.l10n.newPhone,
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
                      context.l10n.sendCode,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      context.read<ProfileBloc>().add(
                        ChangePhoneNumber(
                          currentPhoneNumber:
                          "998${_oldPhoneController.text.trim().replaceAll(
                              " ", "")}",
                          newPhoneNumber:
                          "998${_newPhoneController.text.trim().replaceAll(
                              " ", "")}",
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
