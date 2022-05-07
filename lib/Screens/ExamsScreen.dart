import 'package:cached_network_image/cached_network_image.dart';
import 'package:college_headstart/Screens/WebviewScreen.dart';
import 'package:college_headstart/Styles/ButtonStyles.dart';
import 'package:college_headstart/Styles/TextStyles.dart';
import 'package:college_headstart/service/ExamService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Exams",
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          actions: [],
        ),
        body: ChangeNotifierProvider(
          create: (context) => ExamService(),
          child: Builder(builder: (context) {
            final model = Provider.of<ExamService>(context);
            if (model.examReq == ExamsReq.Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (model.examReq == ExamsReq.Error) {
              return Center(child: Text('An Error Occured'));
            }
            final allExams = model.examsList;
            return ListView.builder(
                itemCount: allExams.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                allExams[i].img.toString(),
                                height: 60,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                allExams[i].examName.toString(),
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Exam Type",
                            style: TextStyles.buildExamSubStyle(),
                          ),
                          Text(
                            allExams[i].examType.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.buildExamConStyle(),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Exam Conducted By",
                            style: TextStyles.buildExamSubStyle(),
                          ),
                          Text(
                            allExams[i].conductedBy.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.buildExamConStyle(),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Exam Level",
                            style: TextStyles.buildExamSubStyle(),
                          ),
                          Text(
                            allExams[i].examLevel.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.buildExamConStyle(),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Eligibility Criteria",
                            style: TextStyles.buildExamSubStyle(),
                          ),
                          Text(
                            allExams[i].eligibility.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.buildExamConStyle(),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Mode of Exam",
                            style: TextStyles.buildExamSubStyle(),
                          ),
                          Text(
                            allExams[i].modeOfExam.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.buildExamConStyle(),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Exam Date",
                            style: TextStyles.buildExamSubStyle(),
                          ),
                          Text(
                            allExams[i].examDate.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.buildExamConStyle(),
                          ),
                          ElevatedButton(
                            style: ButtonStyles.buildButtonStyle(),
                            onPressed: () async {
                              Get.to(WebviewScreen(
                                url: allExams[i].officialWebsite.toString(),
                                title:
                                    allExams[i].examName.toString() + "Details",
                              ));
                            },
                            child: Text('View Complete Details',
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
        ));
  }
}
