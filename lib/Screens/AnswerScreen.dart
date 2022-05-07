import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_headstart/Styles/ButtonStyles.dart';
import 'package:college_headstart/Styles/TextStyles.dart';
import 'package:college_headstart/service/LaunchingService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AnswerScreen extends StatefulWidget {
  final String docId;

  const AnswerScreen({Key? key, required this.docId}) : super(key: key);

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  TextEditingController _textEditingController = new TextEditingController();
  String? errorText;

  void addComment(String commentText, String byUser) {
    // print(comment);
    print(byUser);
    Map<String, dynamic> comment = Map<String, dynamic>();
    comment.addAll({
      "comment": commentText,
      "timestamp": FieldValue.serverTimestamp(),
      "byUser": byUser,
    });
    print(comment);
    try {
      FirebaseFirestore.instance
          .collection('Queries')
          .doc(widget.docId)
          .collection("Discussion")
          .doc()
          .set(comment);
      print("Comment Posted Successfully");
    } catch (e) {
      print("Conmment Not Posted :{");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LaunchingService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              maxLines: 13,
              controller: _textEditingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: new BorderSide(color: Colors.teal)),
                hintText: "Answer...",
                errorText: errorText,
                hintStyle: TextStyles.buildFormHintStyle(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyles.buildButtonStyle(),
                      onPressed: () {
                        if (_textEditingController.text.trim().length > 1) {
                          addComment(_textEditingController.text,
                              user.userData!.fullName.toString());
                        } else {
                          errorText = "To short description";
                        }
                      },
                      child: Text(
                        'Comment',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
