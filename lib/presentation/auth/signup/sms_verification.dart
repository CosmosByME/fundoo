import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/button_loading_indicator.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/presentation/auth/widgets/otp_field.dart';
import 'package:go_router/go_router.dart';

import 'bloc/sign_up_bloc.dart';

class SmsVerificationSignUpPage extends StatefulWidget {
  const SmsVerificationSignUpPage({super.key});

  @override
  State<SmsVerificationSignUpPage> createState() =>
      _SmsVerificationSignUpPageState();
}

class _SmsVerificationSignUpPageState extends State<SmsVerificationSignUpPage> {
  late final TextEditingController _codeController;
  late String phoneNumber;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _codeController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    phoneNumber = context.read<SignUpBloc>().state.phoneNumber;

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.isVerified) {
          context.pushReplacement('/auth/sign-up/otp/personal-info');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
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
              const SizedBox(width: 6),
              Container(
                width: 22,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFFE2E8F0),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.verification,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.l10n.verificationBody,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  phoneNumber,
                  style: TextStyle(
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 30),
                OtpField(controller: _codeController),
                const SizedBox(height: 35),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: _codeController.text.length == 6
                          ? () {
                              context.read<SignUpBloc>().add(
                                SignUpOTPSubmitted(
                                  phoneNumber,
                                  _codeController.text,
                                ),
                              );
                            }
                          : null,
                      backgroundColor: Color(0xFF2563EB),
                      child: state.isLoading
                          ? const ButtonLoadingIndicator()
                          : Text(
                              context.l10n.enter,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
