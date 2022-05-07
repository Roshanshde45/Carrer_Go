import 'package:college_headstart/Constants/Colors.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle buildButtonStyle() => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        )),
      );
}
