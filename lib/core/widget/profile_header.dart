import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fundoo/core/services/file_service.dart';
import 'package:fundoo/data/models/user.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHeader extends StatefulWidget {
  final User user;
  const ProfileHeader({super.key, required this.user});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 68, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final XFile? pickedFile =
                      await FileService.pickImageFromGallery();
                  if (pickedFile != null) {
                    setState(() {
                      image = File(pickedFile.path);
                    });
                  }
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 74,
                      width: 74,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF9CC4FF), Color(0xFF5A8DFF)],
                        ),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.95),
                          width: 2,
                        ),
                        image: image != null
                            ? DecorationImage(
                                image: FileImage(image!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: image != null
                          ? SizedBox.shrink()
                          : const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            ),
                    ),
                    Positioned(
                      right: -1,
                      bottom: -1,
                      child: Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A57E8),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.fullname ?? "-",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.user.displayName ?? "-",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.user.age != null ? "${widget.user.age} yosh": "-",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.75),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Expanded(
            child: Text(
              '"${widget.user.bio ?? "-"}"',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.72),
                height: 1.35,
              ),
              // softWrap: true,
            ),
          ),

        ],
      ),
    );
  }
}
