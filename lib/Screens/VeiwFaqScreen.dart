import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_headstart/Constants/Colors.dart';
import 'package:college_headstart/Screens/FullViewFaq.dart';
import 'package:college_headstart/Styles/ButtonStyles.dart';
import 'package:college_headstart/Styles/TextStyles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewFaqScreen extends StatefulWidget {
  const ViewFaqScreen({Key? key}) : super(key: key);

  @override
  State<ViewFaqScreen> createState() => _ViewFaqScreenState();
}

class _ViewFaqScreenState extends State<ViewFaqScreen> {
  PaginateRefreshedChangeListener refreshChangeListener =
      PaginateRefreshedChangeListener();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "FAQs",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: RefreshIndicator(
        child: PaginateFirestore(
          itemBuilderType: PaginateBuilderType.listView,
          itemBuilder: (context, documentSnapshots, index) {
            Map<String, dynamic> data =
                documentSnapshots[index].data()! as Map<String, dynamic>;

            return Card(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      data["title"],
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      child: Text(
                        data["query"],
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.person_pin),
                        Text("Posted By: ${data["name"]}")
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ButtonStyles.buildButtonStyle(),
                            onPressed: () {
                              Get.to(FullViewFaq(
                                  data: data,
                                  docId: documentSnapshots[index].id));
                            },
                            child: Text(
                              'View More',
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          width: 15.w,
                        ),
                        ElevatedButton(
                            style: ButtonStyles.buildButtonStyle(),
                            onPressed: () {},
                            child: Text(
                              'Answer',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          // orderBy is compulsary to enable pagination
          query: FirebaseFirestore.instance
              .collection('Queries')
              .orderBy('timestamp', descending: true),
          listeners: [
            refreshChangeListener,
          ],
        ),
        onRefresh: () async {
          refreshChangeListener.refreshed = true;
        },
      ),
    );
  }
}
