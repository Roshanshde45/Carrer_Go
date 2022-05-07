import 'package:college_headstart/Screens/CounselScreen.dart';
import 'package:college_headstart/Validation/FaqValidation.dart';
import 'package:college_headstart/Validation/LoginValidation.dart';
import 'package:college_headstart/Validation/SignUpValidation.dart';
import 'package:college_headstart/service/AuthService.dart';
import 'package:college_headstart/service/BannerService.dart';
import 'package:college_headstart/service/LaunchingService.dart';
import 'package:college_headstart/service/ReviewService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/BottomNav.dart';
import 'Screens/OnBoarding/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => LoginValidation()),
        ChangeNotifierProvider(create: (_) => FaqValidation()),
        ChangeNotifierProvider(create: (_) => SignUpValidation()),
        ChangeNotifierProvider(create: (_) => BannerService()),
        ChangeNotifierProvider(create: (_) => ReviewService()),
        ChangeNotifierProvider(create: (_) => LaunchingService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static const primaryColor = Color(0xFF121212);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool send =
        Provider.of<AuthService>(context, listen: false).checkUserState();
    return ScreenUtilInit(
      designSize: Size(360, 760),
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.cyan,
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: Colors.white))),
        themeMode: ThemeMode.light,
        // home: SplashScreen(
        //   authBool: send,
        // ),
        home: SplashScreen(
          authBool: false,
        ),
      ),
    );
  }
}
