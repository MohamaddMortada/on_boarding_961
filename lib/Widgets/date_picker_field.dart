import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Controllers/profile_controller.dart';

class DatePickerField extends StatelessWidget {
  final ProfileController controller;

  const DatePickerField({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("When's your birthday?", style: TextStyle(fontSize: 16)),
            Spacer(),
            GestureDetector(
              onTap: () => _showInfoDialog(context),
              child:
                  const Icon(Icons.info_outline, size: 18, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Obx(() => GestureDetector(
              onTap: () => _showWheelDatePicker(context),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  controller.selectedDate.value == DateTime(1900, 1, 1)
                      ? "Month/Day/Year"
                      : "${controller.selectedDate.value.month}/${controller.selectedDate.value.day}/${controller.selectedDate.value.year}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )),
      ],
    );
  }

  void _showWheelDatePicker(BuildContext context) {
    DateTime tempDate = controller.selectedDate.value;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 250,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: controller.selectedDate.value,
                  minimumDate: DateTime(1900),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    tempDate = newDate;
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    controller.selectDate(tempDate);
                    Get.back();
                  },
                  child: const Text("Done",
                      style: TextStyle(color: Colors.red, fontSize: 16)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showInfoDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text("Why do we ask for your birthday?",
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text(
            "Your birthday won’t be public. We use it to personalize your experience."),
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
