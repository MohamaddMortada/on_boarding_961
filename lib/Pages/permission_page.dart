import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Controllers/permission_controller.dart';
import 'package:on_boarding/widgets/permission_dialog.dart';

class PermissionPage extends StatelessWidget {
  final PermissionController controller = Get.put(PermissionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Permission'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Don't Miss Out With Instant Updates!\n\nBe the first to know about breaking news, surprise giveaways, exclusive deals, and more.\nDon't miss out on what matters most!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.isNotificationEnabled.value
                  ? const Text(
                      "Notifications are enabled!",
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    )
                  : ElevatedButton(
                      onPressed: controller.checkPermissions,
                      child: const Text("Enable Notifications"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
