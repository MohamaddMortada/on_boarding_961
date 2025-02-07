import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Controllers/location_controller.dart';

class LocationStatusText extends StatelessWidget {
  final LocationController controller;

  const LocationStatusText({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLocationEnabled.value
          ? const Text(
              "Location is enabled!",
              style: TextStyle(fontSize: 18, color: Colors.green),
            )
          : const SizedBox.shrink(),
    );
  }
}
