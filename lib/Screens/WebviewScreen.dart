import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebviewScreen extends StatefulWidget {
  final String url;
  final String title;
  const WebviewScreen({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            widget.title.toString(),
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: WebView(
          initialUrl: "https://" + widget.url,
        ));
  }
}
