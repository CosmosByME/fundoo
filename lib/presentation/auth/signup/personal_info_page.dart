import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/services/file_service.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:fundoo/core/widget/img_selecting.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'bloc/sign_up_bloc.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  XFile? image;
  late final TextEditingController _nameController;
  late final TextEditingController _userNameController;
  late final TextEditingController _ageController;
  late FToast ftoast;

  @override
  initState() {
    super.initState();
    ftoast = FToast();
    ftoast.init(context);
    _nameController = TextEditingController();
    _userNameController = TextEditingController();
    _ageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          showErrorToast(ftoast, state.errorMessage!);
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
                  context.l10n.personalInfo,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.l10n.askingInfo,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 15),
                ImgSelecting(
                  image: image,
                  onPressed: () async {
                    final imageS = await FileService.pickImageFromGallery();
                    setState(() {
                      image = imageS;
                    });
                  },
                  onCencel: () async {
                    setState(() {
                      image = null;
                    });
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _nameController,
                  label: "${context.l10n.fullName} *",
                  hint: "Lola Toirxonova",
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _userNameController,
                  label: "${context.l10n.userName} *",
                  hint: "@lola_toirxonova",
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _ageController,
                  label: "${context.l10n.age} *",
                  hint: "25",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 35),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        if (_nameController.text.isEmpty &&
                            _userNameController.text.isEmpty &&
                            _ageController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Please fill in all required fields.",
                              ),
                            ),
                          );
                        } else {
                          final age = int.tryParse(_ageController.text);
                          if (age == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Invalid age. Please enter a valid number.",
                                ),
                              ),
                            );
                            return;
                          }
                          context.read<SignUpBloc>().add(
                            SignUpUserDetailsSubmitted(
                              _nameController.text,
                              _userNameController.text,
                              age,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "User details submitted successfully.",
                              ),
                            ),
                          );
                          context.push('/auth/sign-up/otp/personal-info/done-page');
                        }
                      },
                      backgroundColor: Color(0xFF2563EB),
                      child: state.isLoading
                          ? CircularProgressIndicator.adaptive()
                          : Text(
                              context.l10n.continuing,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
