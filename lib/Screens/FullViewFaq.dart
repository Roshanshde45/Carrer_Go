import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_headstart/Screens/AnswerScreen.dart';
import 'package:college_headstart/Styles/ButtonStyles.dart';
import 'package:college_headstart/service/QueryService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class FullViewFaq extends StatelessWidget {
  final String docId;
  final Map<String, dynamic> data;
  const FullViewFaq({Key? key, required this.docId, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final queryService = Provider.of<QueryService>(context);
    //  final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('Queries')
        .doc(this.docId)
        .collection('Discussion')
        .snapshots();

    return ChangeNotifierProvider(
      create: (_) => QueryService(),
      child: SafeArea(
        child: Scaffold(
            body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      margin: EdgeInsets.zero,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 15.h),
                        // height: 180.h,
                        decoration: BoxDecoration(
                            color: Colors.amber.shade300,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Column(
                          children: [
                            Text(
                              data["title"],
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(data["query"])
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discussion",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      ElevatedButton(
                          style: ButtonStyles.buildButtonStyle(),
                          onPressed: () {
                            Get.to(AnswerScreen(
                              docId: this.docId,
                            ));
                          },
                          child: Text(
                            'Answer',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: 400,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _usersStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("Loading");
                        }

                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            return Card(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data["comment"]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person_pin,
                                                size: 30,
                                                color: Colors.grey.shade500,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(data["byUser"])
                                            ],
                                          ),
                                        ),
                                        Text(timeago
                                            .format(data["timestamp"].toDate()))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
