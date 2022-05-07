import 'package:college_headstart/Styles/TextStyles.dart';
import 'package:college_headstart/service/ArticleService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Share Space",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ArticleService(),
        builder: (context, i) {
          final model = Provider.of<ArticleService>(context);
          if (model.articleReq == ArticleReq.Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (model.articleReq == ArticleReq.Error) {
            return Center(child: Text('An Error Occured'));
          }
          final articles = model.articleList;
          return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, i) => Card(
                    child: ArticleTile(
                      topic: articles[i].topic,
                      content: articles[i].body,
                      writtenBy: articles[i].writtenBy,
                    ),
                  ));
        },
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  final String? topic;
  final String? content;
  final String? writtenBy;
  const ArticleTile({
    this.topic,
    this.content,
    this.writtenBy,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topic!.toString(),
            style: GoogleFonts.adamina(fontSize: 16.sp),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            content!,
            textAlign: TextAlign.justify,
            style: GoogleFonts.ubuntu(
              fontSize: 14.sp,
              wordSpacing: 3,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            children: [
              Icon(Icons.person_outline_outlined),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  writtenBy!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.cyan.shade800),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
