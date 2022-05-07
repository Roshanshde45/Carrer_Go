import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounselScreen extends StatefulWidget {
  const CounselScreen({Key? key}) : super(key: key);

  @override
  State<CounselScreen> createState() => _CounselScreenState();
}

class _CounselScreenState extends State<CounselScreen> {
  int _radioVal = 0;
  int _screenSwitch = 0;
  String? suggestedCourse = "";
  int studentPercentage = 0;

  List options = [
    {
      "option": "PCM",
      "val": 0,
    },
    {
      "option": "PCB",
      "val": 1,
    },
    {
      "option": "Commerce",
      "val": 2,
    },
    {
      "option": "Fashion Desinging & photography",
      "val": 3,
    },
    {
      "option": "Humanities",
      "val": 4,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Answer"),
      ),
      body: getContainer(),
    );
  }

  Container? getContainer() {
    switch (_screenSwitch) {
      case 0:
        return enterDetails();
      case 1:
        return studentMarks();
      case 2:
        return suggestedCourseContainer();
      default:
        Center(
          child: Text("Lol"),
        );
    }
  }

  Container suggestedCourseContainer() {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Our system suggest you to",
            style: TextStyle(fontSize: 25.sp, color: Colors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(suggestedCourse!,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold))
        ],
      )),
    );
  }

  Container studentMarks() {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: Column(children: [
        Text(
          "Enter Your Percentage",
          style: TextStyle(fontSize: 15.sp),
        ),
        SizedBox(
          height: 15.h,
        ),
        TextField(
          decoration: InputDecoration(hintText: "for eg. 80 (without %)"),
          onChanged: (String val) {
            setState(() {
              studentPercentage = int.parse(val);
            });
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        GestureDetector(
          onTap: () {
            if (_radioVal == 0) {
              if (studentPercentage >= 85) {
                setState(() {
                  suggestedCourse = "B.tech";
                });
              } else if (studentPercentage >= 80 && studentPercentage < 85) {
                setState(() {
                  suggestedCourse = "BSC Maths";
                });
              } else if (studentPercentage < 80 && studentPercentage >= 70) {
                setState(() {
                  suggestedCourse = "BSC Physics,Chemistry";
                });
              } else if (studentPercentage < 70) {
                setState(() {
                  suggestedCourse = "Divert the field to any other field";
                });
              }
            } else if (_radioVal == 1) {
              if (studentPercentage > 80) {
                setState(() {
                  suggestedCourse = "MBBS";
                });
              } else if (studentPercentage > 75 && studentPercentage < 80) {
                setState(() {
                  suggestedCourse = "Biotech or Nursing";
                });
              } else if (studentPercentage < 75 && studentPercentage >= 70) {
                setState(() {
                  suggestedCourse = "BSC";
                });
              } else if (studentPercentage < 70) {
                setState(() {
                  suggestedCourse = "Divert the field";
                });
              }
            } else if (_radioVal == 2) {
              if (studentPercentage >= 85) {
                setState(() {
                  suggestedCourse = "B.COM";
                });
              } else if (studentPercentage < 85 && studentPercentage > 75) {
                setState(() {
                  suggestedCourse = "BBA";
                });
              } else if (studentPercentage <= 75 && studentPercentage >= 70) {
                setState(() {
                  suggestedCourse = "Diploma";
                });
              } else if (studentPercentage < 70) {
                setState(() {
                  suggestedCourse = "Change the field or diploma";
                });
              }
            } else if (_radioVal == 3 || _radioVal == 4) {
              if (studentPercentage > 80) {
                setState(() {
                  suggestedCourse = "BA English hons";
                });
              } else if (studentPercentage <= 70) {
                setState(() {
                  suggestedCourse = "BA History";
                });
              }
            } else {
              print("radio Value wrong");
            }
            setState(() {
              _screenSwitch = 2;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          ),
        )
      ]),
    );
  }

  Container enterDetails() {
    return Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Name"),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                decoration: InputDecoration(hintText: "12 th Roll No."),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Course Year"),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options
                      .map((e) => Row(
                            children: [
                              Radio<int>(
                                  value: options.indexOf(e),
                                  groupValue: this._radioVal,
                                  onChanged: (int? value) {
                                    if (value != null) {
                                      setState(() {
                                        this._radioVal = value;
                                      });
                                    }
                                  }),
                              Text(options[options.indexOf(e)]["option"])
                            ],
                          ))
                      .toList()),
              SizedBox(
                height: 70.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _screenSwitch = 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
