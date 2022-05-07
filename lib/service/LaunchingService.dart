import 'package:college_headstart/models/UserInfo.dart';
import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LaunchingService with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  UserInfoModel? userData = new UserInfoModel();

  void getUserData() async {
    final SharedPreferences prefs = await _prefs;
    try {
      userData = UserInfoModel(
          fullName: prefs.getString("name"),
          email: prefs.getString("email"),
          studyingIn: prefs.getString("studyIn"),
          userId: prefs.getString("userId"));
      print("user data fectched !!");
    } catch (e) {
      print("Unable to fetch user data!");
      print(e);
    }
    notifyListeners();
  }

  void setUserData(
      String name, String email, String studyIn, String userId) async {
    final SharedPreferences prefs = await _prefs;
    try {
      prefs.setString("name", name);
      prefs.setString("email", email);
      prefs.setString("studyIn", studyIn);
      prefs.setString("userId", userId);
      print("User Data Saved Successfully");
    } catch (e) {
      print("Unable to fetch user data!!");
      print(e);
    }
  }
}
