import 'package:college_headstart/Screens/OnBoarding/SignUpScreen.dart';
import 'package:college_headstart/Styles/ButtonStyles.dart';
import 'package:college_headstart/Validation/LoginValidation.dart';
import 'package:college_headstart/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<LoginValidation>(context);
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Sign In",
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "images/login.png",
                  height: 200,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      errorText: validationService.email.error,
                      contentPadding: EdgeInsets.only(left: 12),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {
                      validationService.changeEmail(value);
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 12),
                        hintText: "Password",
                        errorText: validationService.password.error),
                    onChanged: (String value) {
                      validationService.changePassword(value);
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ElevatedButton(
                      style: ButtonStyles.buildButtonStyle(),
                      onPressed: (!validationService.isValid)
                          ? null
                          : () {
                              authService.signInWithEmailAndPassword(
                                  validationService.email.value!,
                                  validationService.password.value!);
                            },
                      child: Text(
                        'Login',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text(
                      "Haven't Registered ? Create Account",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
