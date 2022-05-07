import 'package:college_headstart/Styles/ButtonStyles.dart';
import 'package:college_headstart/Styles/TextStyles.dart';
import 'package:college_headstart/Validation/FaqValidation.dart';
import 'package:college_headstart/service/LaunchingService.dart';
import 'package:college_headstart/service/QueryService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostFAQScreen extends StatefulWidget {
  const PostFAQScreen({Key? key}) : super(key: key);

  @override
  State<PostFAQScreen> createState() => _PostFAQScreenState();
}

class _PostFAQScreenState extends State<PostFAQScreen> {
  final QueryService postQueryService = new QueryService();
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<FaqValidation>(context);
    final user = Provider.of<LaunchingService>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Post Query",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: "Heading",
                  hintStyle: TextStyles.buildFormHintStyle(),
                  errorText: validationService.title.error),
              controller: _titleController,
              onChanged: (String value) {
                validationService.changeTitle(value);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            TextField(
              maxLines: 10,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10, top: 10),
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: "Brief your query",
                  hintStyle: TextStyles.buildFormHintStyle(),
                  errorText: validationService.description.error),
              controller: _descController,
              onChanged: (String value) {
                validationService.changeDescription(value);
              },
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyles.buildButtonStyle(),
                    onPressed: () async {
                      await ProgressDialog.future(
                        context,
                        future: Future.delayed(Duration(seconds: 5), () {
                          try {
                            if (validationService.isValid) {
                              postQueryService.postQuery(
                                  validationService.title.value.toString(),
                                  validationService.description.value
                                      .toString(),
                                  user.userData!.fullName.toString());
                            }
                            validationService.resetForm();
                            _titleController.text = "";
                            _descController..text = "";
                          } catch (e) {
                            print(e);
                          }
                        }),
                        message: Text("Please Wait"),
                        cancelText: Text("Batal"),
                        title: Text("Uploading"),
                      );
                    },
                    child: Text(
                      'Post my query',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
