import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeController extends GetxController {
  final box = GetStorage();
  var username = "".obs;

  @override
  void onInit() {
    super.onInit();
    generateUsername();  
  }

  void generateUsername() {
    String firstName = box.read("user")?["firstName"] ?? "User";
    String lastName = box.read("user")?["lastName"] ?? "Guest";

    String baseUsername = "@${firstName.toLowerCase()}${lastName.toLowerCase()}";
    List<String> savedUsernames = box.read("savedUsernames") ?? [];

    String newUsername = baseUsername;
    int counter = 1;
    while (savedUsernames.contains(newUsername)) {
      newUsername = "$baseUsername$counter";
      counter++;
    }

    savedUsernames.add(newUsername);
    box.write("savedUsernames", savedUsernames);
    username.value = newUsername;
  }
}
