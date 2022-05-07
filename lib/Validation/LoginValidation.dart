import 'package:college_headstart/Screens/HomeScreen.dart';
import 'package:college_headstart/Validation/ValidationItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginValidation with ChangeNotifier {
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  ValidationItem get email => _email;
  ValidationItem get password => _password;

  bool get isValid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeEmail(String value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      _email = ValidationItem(value, null);
    } else {
      _email = ValidationItem(null, "Invalid email ID");
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 8) {
      _password = ValidationItem(value, null);
    } else {
      _password = ValidationItem(null, "Password must be 8 characters");
    }
    notifyListeners();
  }

  void login() {
    print("$_email $_password");
    // Get.to(HomeScreen());
    Get.to(() => HomeScreen());
  }
}
