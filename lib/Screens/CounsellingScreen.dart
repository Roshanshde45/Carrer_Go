import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_dialog/easy_dialog.dart';

class CouncellingScreen extends StatefulWidget {
  const CouncellingScreen({Key? key}) : super(key: key);

  @override
  State<CouncellingScreen> createState() => _CouncellingScreenState();
}

class _CouncellingScreenState extends State<CouncellingScreen> {
  late final List<String> texts;
  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Plans"),
      ),
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.topCenter,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 20.h,
          ),
          PremiumTile(
            forTitle: "ENGINEERING COLLEGES",
          ),
          SizedBox(
            height: 20.h,
          ),
          PremiumTile(
            forTitle: "MANAGEMENT COLLEGE",
          ),
          SizedBox(
            height: 20.h,
          ),
          PremiumTile(
            forTitle: "MEDICAL COLLEGE",
          ),
          SizedBox(
            height: 20.h,
          ),
          PremiumTile(
            forTitle: "ARTS COLLEGES",
          ),
          SizedBox(
            height: 20.h,
          ),
        ]),
      )),
    );
  }
}

class PremiumTile extends StatelessWidget {
  final String forTitle;
  const PremiumTile({
    required this.forTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Text(
          forTitle,
          style: TextStyle(fontSize: 18.sp),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "₹299/Month",
          style: TextStyle(fontSize: 26.sp),
        ),
        SizedBox(
          height: 17.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("➊ Personalised career report"),
            SizedBox(
              height: 10.h,
            ),
            Text("➋ 1 Personal counselling session with experts"),
            SizedBox(
              height: 10.h,
            ),
            Text("➌ Orientation on percentile and rank system"),
            SizedBox(
              height: 10.h,
            ),
            Text("➍ Identification of alternatives to JEE"),
            TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.blue.withOpacity(0.04);
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.blue.withOpacity(0.12);
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  EasyDialog(
                          title: Text("Congratulations!!"),
                          description: Text(
                              "You will soon receive a mail to make payment after that your subscription will start.\nThank You"))
                      .show(context);
                },
                child: Text('Get Premium'))
          ],
        )
      ]),
    );
  }
}
