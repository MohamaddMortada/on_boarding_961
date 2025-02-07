import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Controllers/language_controller.dart';
import 'package:on_boarding/Widgets/customed_text.dart';
import 'package:on_boarding/Widgets/laguage_option.dart';
import 'package:on_boarding/Widgets/main_button.dart';

class LanguagePage extends StatelessWidget {
  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            CustomedText(
              text: '961',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Obx(() => Column(
                  children: controller.languages.map((lang) {
                    bool isSelected =
                        controller.selectedLanguage.value == lang["name"];
                    return LanguageOption(
                      languageName: lang["name"]!,
                      languageCode: lang["code"]!,
                      isSelected: isSelected,
                      onTap: () => controller.changeLanguage(lang["name"]!),
                    );
                  }).toList(),
                )),
            const Spacer(),
            MainButton(
              text: 'Confirm',
              onPressed: () {
                Get.snackbar("Language Selected",
                    "You chose ${controller.selectedLanguage.value}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
