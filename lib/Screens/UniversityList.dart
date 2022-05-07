import 'package:college_headstart/Screens/CollegeDetailScreen.dart';
import 'package:college_headstart/service/CollegesService.dart';
import 'package:college_headstart/service/UniversityService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:college_headstart/Styles/TextStyles.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

class UniversityList extends StatelessWidget {
  const UniversityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Universities"),
          actions: [],
        ),
        body: ChangeNotifierProvider(
          create: (context) => CollegesService(),
          child: Builder(builder: (context) {
            final model = Provider.of<CollegesService>(context);
            if (model.collegesReq == CollegesReq.Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (model.collegesReq == CollegesReq.Error) {
              return Center(child: Text('An Error Occured'));
            }
            final univLists = model.collegeList;
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: univLists.length,
                itemBuilder: (context, i) {
                  // return UniversityTile(
                  //   instName: univLists[i].collegeName,
                  //   program: univLists[i].collegeType,
                  //   state: univLists[i].state,
                  // );
                  return GestureDetector(
                    onTap: () {
                      Get.to(CollegeDetailsScreen(college: univLists[i]));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150.h,
                              width: double.infinity,
                              color: Colors.black,
                              child: Hero(
                                tag: univLists[i].id.toString(),
                                child: Image.network(
                                  univLists[i].img.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  univLists[i].collegeName.toString(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
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
                              univLists[i].collegeType.toString(),
                              style: TextStyle(color: Colors.blue),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_city),
                                Text(univLists[i].state.toString())
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              univLists[i].overview.toString(),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Read more...",
                              style: TextStyle(color: Colors.blue),
                            )
                          ]),
                    ),
                  );
                });
          }),
        ));
  }
}

class UniversityTile extends StatelessWidget {
  final String? instName;
  final String? state;
  final String? program;
  const UniversityTile({
    this.instName,
    this.program,
    this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(10.w),
        height: 136.h,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Institute Name: "),
            Text(
              instName!,
              style: TextStyles.buildCardHeadStyle(),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("State:"),
            Text(
              state!,
              style: TextStyles.buildCardHeadStyle(),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text("Program:"),
            Text(
              program!,
              style: TextStyles.buildCardHeadStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
