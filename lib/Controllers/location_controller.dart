import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  var isLocationEnabled = false.obs;

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse || 
        permission == LocationPermission.always) {
      isLocationEnabled.value = true;
    } else {
      isLocationEnabled.value = false;
    }
  }
}
