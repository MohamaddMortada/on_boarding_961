import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Controllers/location_controller.dart';

void showLocationPermissionDialog(BuildContext context) {
  final LocationController controller = Get.find<LocationController>();

  Get.dialog(
    AlertDialog(
      title: const Text("Enable Location"),
      content: const Text(
        "This app needs location access to provide better services.",
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text("Cancel", style: TextStyle(color: Colors.red)),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(); 
            controller.requestLocationPermission();
          },
          child: const Text("Allow"),
        ),
      ],
    ),
  );
}
