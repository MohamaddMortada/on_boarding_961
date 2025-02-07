import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'English'.obs;

  final List<Map<String, String>> languages = [
    {"name": "English", "code": "gb"},
    {"name": "français", "code": "fr"},
    {"name": "عربي", "code": "sa"},
  ];

  void changeLanguage(String language) {
    selectedLanguage.value = language;
  }
}
