import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class QueryService with ChangeNotifier {
  CollectionReference _queriesRef =
      FirebaseFirestore.instance.collection('Queries');

  void postQuery(String title, String query, String name) async {
    String uID = FirebaseAuth.instance.currentUser!.uid;
    try {
      if (uID != null) {
        Map<String, dynamic> queryData = new Map<String, dynamic>();
        queryData.addAll({
          "title": title,
          "query": query,
          "postedByUser": uID,
          "name": name,
          "timestamp": FieldValue.serverTimestamp()
        });
        await _queriesRef.doc().set(queryData);
      }
      print("Query Posted Successfully!!");
    } catch (e) {
      print("Query not posted :(");
      print(e);
    }
  }

  Future getQueryDiscussion(String docId) async {
    try {
      return await _queriesRef.doc(docId).get();
    } catch (e) {
      print("Unable to fetch discussions :(");
      print(e);
    }
  }
}
