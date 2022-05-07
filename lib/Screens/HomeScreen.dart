import 'package:carousel_slider/carousel_slider.dart';
import 'package:college_headstart/Constants/ApiTiles.dart';
import 'package:college_headstart/Constants/Colors.dart';
import 'package:college_headstart/Screens/ArticlesScreen.dart';
import 'package:college_headstart/Screens/ExamsScreen.dart';
import 'package:college_headstart/Screens/UniversityList.dart';
import 'package:college_headstart/Screens/VeiwFaqScreen.dart';
import 'package:college_headstart/Screens/WebviewScreen.dart';
import 'package:college_headstart/Styles/TextStyles.dart';
import 'package:college_headstart/chatbot/ChatScreen.dart';
import 'package:college_headstart/service/BannerService.dart';
import 'package:college_headstart/service/LaunchingService.dart';
import 'package:college_headstart/service/ReviewService.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<LaunchingService>(context, listen: false).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "CarrerGo",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [],
      ),
      body: Builder(
        builder: (context) {
          final model = Provider.of<BannerService>(context);
          final rev = Provider.of<ReviewService>(context);
          if (model.bannerReq == BannerReq.Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (model.bannerReq == BannerReq.Error) {
            return Center(child: Text('An Error Occured'));
          }
          final banners = model.bannerList;
          final reviews = rev.reviewsList;
          print("Banner List Length: ${banners.length}");
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 145.h,
                        autoPlay: true,
                        disableCenter: true,
                        enlargeCenterPage: true),
                    items: banners.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(i.image.toString()),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  child: Image.network(i.image.toString())),
                              Positioned(
                                left: 10.w,
                                bottom: 7.h,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    i.title.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.sp),
                                    // textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Wrap(
                    spacing: 15.w, // gap between adjacent chips
                    runSpacing: 8.h,
                    children: ApiTiles.apiList
                        .map((e) => InkWell(
                              onTap: () {
                                switch (ApiTiles
                                        .apiList[ApiTiles.apiList.indexOf(e)]
                                    ["route"]) {
                                  case "university":
                                    {
                                      Get.to(UniversityList());
                                    }
                                    break;
                                  case "article":
                                    {
                                      Get.to(ArticleScreen());
                                    }
                                    break;
                                  case "exam":
                                    {
                                      Get.to(ExamsScreen());
                                    }
                                    break;
                                  case "faq":
                                    {
                                      Get.to(ViewFaqScreen());
                                    }
                                    break;
                                  case "chatbot":
                                    {
                                      Get.to(ChatScreen());
                                    }
                                }
                              },
                              child: Material(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: CustomColors.veryLightGrey,
                                  ),
                                  height: 80.h,
                                  width: 100.w,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ApiTiles.apiList[ApiTiles.apiList
                                              .indexOf(e)]["img"],
                                          height: 38.h,
                                          color: Colors.cyan.shade600,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          ApiTiles.apiList[ApiTiles.apiList
                                              .indexOf(e)]["title"],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17.w),
                        child: Text(
                          "Top Ranking College (NIRF)",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TopCollegesTile(
                    img: "images/engineers.png",
                    title: "Engineering",
                    onPress: () {
                      Get.to(WebviewScreen(
                          url: "www.nirfindia.org/2021/EngineeringRanking.html",
                          title: "Engineering Top Colleges"));
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TopCollegesTile(
                    img: "images/management.png",
                    title: "Management",
                    onPress: () {
                      Get.to(WebviewScreen(
                          url: "www.nirfindia.org/2021/ManagementRanking.html",
                          title: "Management Top Colleges"));
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TopCollegesTile(
                    img: "images/doctor.png",
                    title: "Medical",
                    onPress: () {
                      Get.to(WebviewScreen(
                          url: "www.nirfindia.org/2021/MedicalRanking.html",
                          title: "Medical Top Colleges"));
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TopCollegesTile(
                    img: "images/arts.png",
                    title: "Arts",
                    onPress: () {
                      Get.to(WebviewScreen(
                          url: "www.nirfindia.org/2021/CollegeRanking.html",
                          title: "Arts Top Colleges"));
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "What our users have to say?🙂",
                          textAlign: TextAlign.start,
                          style: TextStyles.buildButtonStyle(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 145.h,
                        autoPlay: false,
                        disableCenter: true,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: false),
                    items: reviews.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: ReviewTile(
                                stars: i.stars,
                                name: i.name,
                                profession: i.profession,
                                review: i.review,
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 50.h,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TopCollegesTile extends StatelessWidget {
  final String img;
  final String title;
  final VoidCallback onPress;
  const TopCollegesTile({
    required this.img,
    required this.onPress,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: GestureDetector(
        onTap: onPress,
        child: Card(
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      img,
                      height: 50,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      title,
                      style: TextStyle(fontSize: 13.sp),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final int? stars;
  final String? name;
  final String? profession;
  final String? review;
  const ReviewTile({
    this.stars,
    this.name,
    this.profession,
    this.review,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      width: 240.w,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 17.w,
                  child: Image.asset(
                    "images/user.png",
                    height: 25.w,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(name!), Text(profession!)],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                    review!,
                    // overflow: TextOverflow.ellipsis,
                  ))
                ],
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RatingBarIndicator(
                  rating: double.parse(stars.toString()),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                    }
                    throw new Exception();
                  },
                  itemCount: 5,
                  itemSize: 25.0,
                  direction: Axis.horizontal,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
