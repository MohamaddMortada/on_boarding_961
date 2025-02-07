import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Controllers/profile_controller.dart';

class GenderSelection extends StatelessWidget {
  final ProfileController controller;

  const GenderSelection({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genderIcons = {
      "Male": Icons.male,
      "Female": Icons.female,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("What’s your gender?", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: genderIcons.entries.map((entry) {
                bool isSelected = controller.selectedGender.value == entry.key;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => controller.selectGender(entry.key),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: isSelected ? Theme.of(context).primaryColor : const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromARGB(255, 195, 195, 195)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(entry.value, size: 20, color: isSelected ? Colors.white : Colors.black),
                          const SizedBox(width: 8),
                          Text(
                            entry.key,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            )),
      ],
    );
  }
}
