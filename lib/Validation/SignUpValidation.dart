import 'package:college_headstart/Validation/ValidationItem.dart';
import 'package:flutter/cupertino.dart';

class SignUpValidation with ChangeNotifier {
  ValidationItem _fullName = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _studying = ValidationItem(null, null);

  ValidationItem get fullName => _fullName;

  ValidationItem get email => _email;

  ValidationItem get password => _password;

  ValidationItem get studying => _studying;

  bool get isValid {
    if (_fullName.value != null &&
        _email.value != null &&
        _password.value != null &&
        _studying.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeName(String value) {
    if (value != null) {
      _fullName = ValidationItem(value, null);
    } else {
      _fullName = ValidationItem(null, "Full name is mandatory");
    }
    notifyListeners();
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

  void changeStudying(String value) {
    if (value.length > 0) {
      _studying = ValidationItem(value, null);
    } else {
      _studying = ValidationItem(null, "Studying is required right now.");
    }
    notifyListeners();
  }
}
