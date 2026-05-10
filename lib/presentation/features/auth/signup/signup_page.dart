import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/enter_number.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late FToast ftoast;
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ftoast = FToast();
    ftoast.init(context);
    _phoneController.addListener(() => debugPrint(_phoneController.text));
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          showErrorToast(ftoast, state.errorMessage!);
        }
        if (state.otpSent) {
          context.push('/auth/sign-up/otp');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                  context.l10n.register,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.l10n.askingPhone,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                EnterNumberField(controller: _phoneController),
                const SizedBox(height: 35),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        debugPrint(
                          'Phone number submitted: 998${_phoneController.text.replaceAll(' ', '')}',
                        );
                        context.read<SignUpBloc>().add(
                          SignUpPhoneNumberSubmitted(
                            '998${_phoneController.text.replaceAll(' ', '')}',
                          ),
                        );
                      },
                      backgroundColor: Color(0xFF2563EB),
                      child: state.isLoading
                          ? CircularProgressIndicator.adaptive()
                          : Text(
                              context.l10n.sendCode,
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
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.l10n.haveAccount,
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/auth/log-in');
                        },
                        child: Text(
                          context.l10n.logIn,
                          style: TextStyle(color: Color(0xFF2563EB)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
