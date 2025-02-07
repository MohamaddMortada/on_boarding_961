import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Controllers/profile_controller.dart';
import 'package:on_boarding/Widgets/main_button.dart';
import 'package:on_boarding/widgets/blood_type_selection.dart';
import 'package:on_boarding/widgets/date_picker_field.dart';
import 'package:on_boarding/widgets/gender_selection.dart';
import 'package:on_boarding/widgets/profile_picture.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePicture(controller: controller),

            const SizedBox(height: 20),
            
            DatePickerField(controller: controller),

            const SizedBox(height: 20),

            GenderSelection(controller: controller),

            const SizedBox(height: 20),

            BloodTypeSelection(controller: controller),

            const Spacer(),

            MainButton(
              text: "Save Profile",
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
