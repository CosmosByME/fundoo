import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/enter_number.dart';
import 'package:fundoo/presentation/features/auth/login/bloc/log_in_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FToast ftoast;
  final TextEditingController _phoneController = TextEditingController();

  @override
  initState() {
    super.initState();
    ftoast = FToast();
    ftoast.init(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInBloc, LogInState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          showErrorToast(ftoast, state.errorMessage!);
        }
        if (state.otpSent) {
          context.push('/auth/log-in/otp');
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.enter,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.l10n.enterPhone,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                EnterNumberField(controller: _phoneController),
                const SizedBox(height: 35),
                BlocBuilder<LogInBloc, LogInState>(
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        context.read<LogInBloc>().add(
                          LogInPhoneNumberSubmitted(
                            "998${_phoneController.text.replaceAll(' ', '')}",
                          ),
                        );
                      },
                      backgroundColor: Color(0xFF2563EB),
                      child: state.isLoading
                          ? CircularProgressIndicator(color: Colors.white)
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
                        context.l10n.noAccount,
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/auth/sign-up');
                        },
                        child: Text(
                          context.l10n.createAccount,
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
