import 'package:college_headstart/Validation/ValidationItem.dart';
import 'package:flutter/cupertino.dart';

class FaqValidation with ChangeNotifier {
  ValidationItem _qTitle = ValidationItem(null, null);
  ValidationItem _qDescription = ValidationItem(null, null);

  ValidationItem get title => _qTitle;
  ValidationItem get description => _qDescription;

  bool get isValid {
    if (_qTitle.value != null && _qDescription.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeTitle(String value) {
    if (value.length < 8) {
      _qTitle = ValidationItem(null, "Topic length is too short");
    } else {
      _qTitle = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changeDescription(String value) {
    if (value.length < 20) {
      _qDescription = ValidationItem(null, "Description length is too short");
    } else {
      _qDescription = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void resetForm() {
    _qTitle = ValidationItem(null, null);
    _qDescription = ValidationItem(null, null);
    notifyListeners();
  }
}
