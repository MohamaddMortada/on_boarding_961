import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_boarding/Controllers/profile_controller.dart';

class ProfilePicture extends StatelessWidget {
  final ProfileController controller;

  const ProfilePicture({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Obx(() {
              return CircleAvatar(
                radius: 50,
                backgroundImage: controller.profileImage.value != null
                    ? FileImage(File(controller.profileImage.value!.path))
                    : const AssetImage("assets/profile-pic.jpg") as ImageProvider,
              );
            }),
            const SizedBox(width: 10),

            OutlinedButton.icon(
              onPressed: () => _pickImage(),
              icon: const Icon(Icons.upload_outlined, color: Colors.black, size: 20),
              label: const Text(
                "Upload Profile Pic",
                style: TextStyle(color: Colors.black),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color.fromARGB(107, 0, 0, 0)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
            ),

            const Spacer(),

            GestureDetector(
              onTap: () => _showInfoDialog(context),
              child: const Icon(Icons.info_outline, size: 18, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  void _pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    File selectedFile = File(image.path); 
    Get.find<ProfileController>().profileImage.value = selectedFile as XFile?;
  }
}
  void _showInfoDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text("Profile Picture Requirement", style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text("To maximize your experience and access certain features, you need to have a real picture."),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("OK", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
