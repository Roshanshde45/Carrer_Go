import 'dart:async';
import 'package:college_headstart/Screens/BottomNav.dart';
import 'package:college_headstart/service/AuthService.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  final bool authBool;
  const SplashScreen({Key? key, required this.authBool}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future<Timer> loadData() async {
  //   return Timer(
  //       Duration(
  //         seconds: 2,
  //       ), () {
  //     if (authService.checkUserState()) {
  //       Get.to(BottomNav());
  //     } else {
  //       Get.to(LoginScreen());
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(
          seconds: 2,
        ), () {
      if (this.widget.authBool) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BottomNav()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Timer(
    //     Duration(
    //       seconds: 2,
    //     ), () {
    //   if (Provider.of<AuthService>(context, listen: false).checkUserState()) {
    //     Get.to(BottomNav());
    //   } else {
    //     Get.to(LoginScreen());
    //   }
    // });
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/success.png",
            height: 100,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "CarrerGo",
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
