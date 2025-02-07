import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImage = Rxn<XFile>(); 
  var selectedDate = DateTime.now().obs;
  var selectedGender = "".obs;
  var selectedBloodType = "".obs;
  var selectedRhFactor = "".obs;
  var selectedFullBloodType = "".obs; 

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = image;
    }
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void selectBloodType(String bloodType) {
    selectedBloodType.value = bloodType;
    _updateFullBloodType();
  }

  void selectRhFactor(String rhFactor) {
    selectedRhFactor.value = rhFactor;
    _updateFullBloodType();
  }

  void _updateFullBloodType() {
    if (selectedBloodType.value.isNotEmpty && selectedRhFactor.value.isNotEmpty) {
      selectedFullBloodType.value = "${selectedBloodType.value}${selectedRhFactor.value}";
      
      Get.snackbar(
        "Blood Type Updated",
        "Your new blood type is ${selectedFullBloodType.value}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(146, 0, 0, 0),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
  }
}
