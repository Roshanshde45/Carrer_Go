import 'package:college_headstart/Constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle buildButtonStyle() => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      );

  static TextStyle buildCardHeadStyle() => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
      );

  static TextStyle buildFormHintStyle() =>
      TextStyle(fontSize: 14.sp, fontStyle: FontStyle.italic);

  static TextStyle buildExamSubStyle() =>
      TextStyle(fontSize: 14.sp, fontStyle: FontStyle.normal);

  static TextStyle buildExamConStyle() => TextStyle(
      fontSize: 15.sp,
      fontStyle: FontStyle.normal,
      color: Colors.cyan.shade800);
}
