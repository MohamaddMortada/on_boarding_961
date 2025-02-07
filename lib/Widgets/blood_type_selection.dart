import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Controllers/profile_controller.dart';

class BloodTypeSelection extends StatelessWidget {
  final ProfileController controller;

  const BloodTypeSelection({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloodGroups = ["A", "B", "AB", "O"];
    final rhFactors = ["+ Positive", "- Negative"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("What’s your blood type?",
                style: TextStyle(fontSize: 16)),
            const Spacer(),
            GestureDetector(
              onTap: () => _showBloodTypeInfoDialog(context),
              child:
                  const Icon(Icons.info_outline, size: 18, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bloodGroups.map((type) {
                bool isSelected = controller.selectedBloodType.value == type;
                return GestureDetector(
                  onTap: () => controller.selectBloodType(type),
                  child: _bloodTypeContainer(type, isSelected),
                );
              }).toList(),
            )),
        const SizedBox(height: 10),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rhFactors.map((rh) {
                bool isSelected = controller.selectedRhFactor.value == rh;
                return GestureDetector(
                  onTap: () => controller.selectRhFactor(rh),
                  child: _bloodTypeContainer(rh, isSelected),
                );
              }).toList(),
            )),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _bloodTypeContainer(String text, bool isSelected) {
    double width = (text == "+ Positive" || text == "- Negative")
        ? 150
        : 70; // Adjust width for longer text

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color:
            isSelected ? Colors.red : const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 200, 200, 200)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  void _showBloodTypeInfoDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text("Blood Type Information",
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoRow(
                text:
                    "You'll be notified if someone urgently needs your blood type in a nearby hospital."),
            _InfoRow(text: "Giving blood is completely optional."),
            _InfoRow(
                text:
                    "Enrolling in this program is optional and you can always opt out."),
          ],
        ),
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

class _InfoRow extends StatelessWidget {
  final String text;
  const _InfoRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, size: 18, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
