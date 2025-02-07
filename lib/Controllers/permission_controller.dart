import 'package:get/get.dart';
import 'package:on_boarding/widgets/permission_dialog.dart';

class PermissionController extends GetxController {
  var isNotificationEnabled = false.obs;

  void enableNotifications() {
    isNotificationEnabled.value = true;
    Get.back();
  }

  void disableNotifications() {
    isNotificationEnabled.value = false;
    Get.back(); 
  }

  void checkPermissions() {
    if (!isNotificationEnabled.value) {
      Get.dialog(
        PermissionDialog(
          onEnable: enableNotifications,
          onDisable: disableNotifications,
        ),
      );
    }
  }
}
