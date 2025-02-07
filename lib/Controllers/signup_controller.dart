import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController {
  var user = User().obs;
  final box = GetStorage(); // GetStorage instance

  @override
  void onInit() {
    super.onInit();
    loadUserData(); // Load saved data on app start
  }

  void updateFirstName(String firstName) {
    user.update((val) {
      val?.firstName = firstName;
    });
    saveUserData();
  }

  void updateLastName(String lastName) {
    user.update((val) {
      val?.lastName = lastName;
    });
    saveUserData();
  }

  void updatePhoneNumber(String phoneNumber) {
    user.update((val) {
      val?.phoneNumber = phoneNumber;
    });
    saveUserData();
  }

  void updateEmail(String email) {
    user.update((val) {
      val?.email = email;
    });
    saveUserData();
  }

  void updatePassword(String password) {
    user.update((val) {
      val?.password = password;
    });
    saveUserData();
  }

  void signUp() {
    print('User Signed Up: ${user.value}');
    saveUserData();
    Get.toNamed('welcome');
  }

  void saveUserData() {
    box.write("user", {
      "firstName": user.value.firstName,
      "lastName": user.value.lastName,
      "phoneNumber": user.value.phoneNumber,
      "email": user.value.email,
      "password": user.value.password,
    });
  }

  void loadUserData() {
    var savedUser = box.read("user");
    if (savedUser != null) {
      user.value = User(
        firstName: savedUser["firstName"],
        lastName: savedUser["lastName"],
        phoneNumber: savedUser["phoneNumber"],
        email: savedUser["email"],
        password: savedUser["password"],
      );
    }
  }
}
