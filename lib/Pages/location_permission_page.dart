import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Controllers/location_controller.dart';
import 'package:on_boarding/Widgets/location_permission_dialog.dart';
import 'package:on_boarding/Widgets/main_button.dart';
import 'package:on_boarding/widgets/location_status_text.dart';

class LocationPermissionPage extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enable Location")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocationStatusText(controller: controller),
            const SizedBox(height: 20),
            Obx(
              () => controller.isLocationEnabled.value
                  ? const SizedBox.shrink()
                  : MainButton(
                      text: 'Enable Location',
                      onPressed: () => showLocationPermissionDialog(context),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
