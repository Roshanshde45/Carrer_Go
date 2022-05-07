import 'package:college_headstart/Screens/CounselScreen.dart';
import 'package:college_headstart/Screens/CounsellingScreen.dart';
import 'package:college_headstart/models/UserInfo.dart';
import 'package:college_headstart/service/AuthService.dart';
import 'package:college_headstart/service/LaunchingService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<LaunchingService>(context, listen: false).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LaunchingService>(context);
    final authService = Provider.of<AuthService>(context);

    // user.getUserData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Profile",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                authService.signOut();
              },
              icon: Icon(Icons.logout))
        ],
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.perm_identity,
                  color: Colors.cyan,
                  size: 100,
                )),
            SizedBox(
              height: 10.h,
            ),
            Text(
              user.userData!.fullName.toString(),
              style: TextStyle(fontSize: 17.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Studying In",
              style: TextStyle(fontSize: 13.sp, fontStyle: FontStyle.italic),
            ),
            Text(
              user.userData!.studyingIn.toString(),
              style: TextStyle(fontSize: 17.sp),
            ),
            Divider(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "My Dashboard",
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(CouncellingScreen());
              },
              child: Text(
                "Book For Councelling",
                style: TextStyle(fontSize: 12.sp, color: Colors.orange),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(CounselScreen());
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Quick Councelling",
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
