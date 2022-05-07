import 'package:college_headstart/Styles/ButtonStyles.dart';
import 'package:college_headstart/Validation/LoginValidation.dart';
import 'package:college_headstart/Validation/SignUpValidation.dart';
import 'package:college_headstart/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignUpValidation>(context);
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Create new account",
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
                  height: 170,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Full Name",
                        contentPadding: EdgeInsets.only(left: 12),
                        border: OutlineInputBorder(),
                        errorText: validationService.fullName.error),
                    onChanged: (String value) {
                      validationService.changeName(value);
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        contentPadding: EdgeInsets.only(left: 12),
                        border: OutlineInputBorder(),
                        errorText: validationService.email.error),
                    onChanged: (String value) {
                      validationService.changeEmail(value);
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        contentPadding: EdgeInsets.only(left: 12),
                        border: OutlineInputBorder(),
                        errorText: validationService.password.error),
                    obscureText: true,
                    onChanged: (String value) {
                      validationService.changePassword(value);
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Studying In",
                        contentPadding: EdgeInsets.only(left: 12),
                        border: OutlineInputBorder(),
                        errorText: validationService.studying.error),
                    onChanged: (String value) {
                      validationService.changeStudying(value);
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ElevatedButton(
                      style: ButtonStyles.buildButtonStyle(),
                      onPressed: () {
                        if (validationService.isValid) {
                          final user =
                              authService.createUserWithEmailAndPassword(
                                  validationService.email.value,
                                  validationService.password.value,
                                  validationService.fullName.value,
                                  validationService.studying.value);
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
