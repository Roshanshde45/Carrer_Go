import 'package:college_headstart/models/College.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CollegeDetailsScreen extends StatefulWidget {
  final CollegeModel college;
  const CollegeDetailsScreen({Key? key, required this.college})
      : super(key: key);

  @override
  State<CollegeDetailsScreen> createState() => _CollegeDetailsScreenState();
}

class _CollegeDetailsScreenState extends State<CollegeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: GestureDetector(
              onTap: () async {
                if (await canLaunch(widget.college.collegeUrl.toString()))
                  await launch(widget.college.collegeUrl.toString());
                else
                  // can't launch url, there is some error
                  throw "Could not launch ${widget.college.collegeUrl.toString()}";
              },
              child: Row(
                children: [Icon(Icons.language), Text("Visit Site")],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 170.h,
              width: double.infinity,
              color: Colors.black,
              child: Hero(
                tag: widget.college.id.toString(),
                child: Image.network(
                  widget.college.img.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    widget.college.collegeName.toString(),
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade800,
                          ),
                          Text("4.6")
                        ],
                      )
                    ],
                  ),
                  Text(
                    widget.college.collegeType.toString(),
                    style: TextStyle(color: Colors.blue),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_city),
                      Text(widget.college.state.toString())
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(widget.college.overview.toString())
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
