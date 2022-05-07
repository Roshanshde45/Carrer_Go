import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_headstart/Screens/BottomNav.dart';
import 'package:college_headstart/models/User.dart';
import 'package:college_headstart/models/UserInfo.dart';
import 'package:college_headstart/service/LaunchingService.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthService with ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  LaunchingService launchingService = new LaunchingService();
  UserInfoModel? userInfo;

  UserModel? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(user.uid, user.email);
  }

  Stream<UserModel?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  bool checkUserState() {
    bool isSignedIn = false;
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        isSignedIn = false;
      } else {
        print('User is signed in!');
        isSignedIn = true;
      }
    });
    return isSignedIn;
  }

  Future<UserModel?>? signInWithEmailAndPassword(
      String email, String password) async {
    auth.User? u;
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      credential.user != null
          ? u = credential.user
          : print("User not singned!!");

      if (u?.email != null) {
        print("SignIn Successfull!!");
        Get.to(BottomNav());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }

    return _userFromFirebase(u);
  }

  /*
    Registering user and saving data to firestore
   */
  Future<UserModel?>? createUserWithEmailAndPassword(
      String? email, String? password, String? name, String? study) async {
    auth.User? u;
    try {
      auth.UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!);

      u = credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("Cannot register user!!");
      print(e);
    }

    if (u?.email != null) {
      print("User Created Successfully!!");
      Map<String, String> userInfo = new Map<String, String>();
      userInfo.addAll(
          {"name": name!, "email": email!, "studyIn": study!, "uid": u!.uid});
      try {
        await FirebaseFirestore.instance
            .collection("Profiles")
            .doc(u.uid)
            .set(userInfo);
        launchingService.setUserData(name, email, study, u.uid);
        Get.to(BottomNav());
      } catch (e) {
        print(":::Something went wrong while saving data:::");
        print(e);
      }
    }
    return _userFromFirebase(u);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
