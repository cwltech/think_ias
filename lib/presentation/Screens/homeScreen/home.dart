import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:think_ias/app/constant/app.key.dart';
import 'package:think_ias/core/Provider/lists.providers.dart';

import '../../../app/constant/constant.color.dart';
import '../courseScreen/course.dart';
import '../drawer.dart';
import '../loginScreen/login.dart';
import 'homeScreenWidget/home.screen.widget.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String userID = AppKeys.userLoginKey;

  void getInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      userID = pref.getString(AppKeys.userLoginKey)!;
    });
  }

//  List of Banner
  List _bannerList = [];

// List Category NAME
  List<String> categoryName = [
    "ECONOMICS",
    "ENVIRONMENT",
    "ESSAY & QUOTES",
    "ETHICS",
    "GEOGRAPHY",
    "HISTORY",
    "ORGANIZATIONS ",
    "MAPS",
    "POLITY",
    "SCIENCE & TECH",
    "SOCIETY",
    "OPTIONAL",
    "SECURITY",
    "STATIC INFORMATION",
    "SCHEMES",
  ];

  //List Category IMAGE

  List<String> categoryimg = [
    "assets/images/economic.png",
    "assets/images/earth.png",
    "assets/images/essay.png",
    "assets/images/ethics.png",
    "assets/images/geography.png",
    "assets/images/clock.png",
    "assets/images/two2.png",
    "assets/images/organization.png",
    "assets/images/placeholder (1).png",
    "assets/images/politics.png",
    "assets/images/science & tech.png",
    "assets/images/society.png",
    "assets/images/control.png",
    "assets/images/security.png",
    "assets/images/statistics.png",
    "assets/images/schemes.png",
  ];

  List<String> category = [
    "Economy Course",
    "Environment Modules for upsc",
    "Science and Technology Module",
    "Economy Course",
    "Environment Modules for upsc",
    "Science and Technology Module",
  ];

  List<String> discription = [
    "Complete Conceptual Clarity and Comprehensive Coverage of Economy.",
    "Comprehenive Coverage of both current and static syllabus",
    "National and international bodies ,indexes and reports",
    "Complete Conceptual Clarity and Comprehensive Coverage of Economy.",
    "Comprehenive Coverage of both current and static syllabus",
    "National and international bodies ,indexes and reports",
    "National and international bodies ,indexes and reports",
  ];

  List<String> price = [
    "RS. 1000",
    "RS. 2000",
    "RS. 100",
    "RS. 5000",
    "RS. 1000",
    "RS. 1000",
    "RS. 6000",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ListOfDataProvider>(context, listen: false);
      Provider.of<ListOfDataProvider>(context, listen: false)
          .fetchListOfData(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: SizedBox(
            width: 70.w, child: Image.asset('assets/images/thinkiaslogo.png')),
        elevation: 0,
        actions: <Widget>[
          TextButton(
            child: Text(
              "Login",
              style: TextStyle(color: AppColor.primaryTextColor),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SafeArea(
            child: Container(
              color: Colors.white,
              height: constraints.maxHeight.h,
              child: SingleChildScrollView(
                child:
                    Consumer<ListOfDataProvider>(builder: (context, state, _) {
                  final listofData = state.listDatas;
                  print(listofData);

                  return Column(
                    children: <Widget>[
                      CarouselSlider.builder(
                          itemCount: listofData.data!.bannerList!.length,
                          options: CarouselOptions(
                            aspectRatio: 2,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: true,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: false,
                            enlargeFactor: 0.3,
                            // onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          ),
                          itemBuilder: (context, index, _) {
                            var itemCurrentBanner =
                                listofData.data!.bannerList![index];
                            return Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.network(
                                itemCurrentBanner.banner!,
                                fit: BoxFit.fill,
                              ),
                            );
                          }),
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      /* Category Section */
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listofData.data!.categoryList!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            final itemCurrentCategory =
                                listofData.data!.categoryList![index];
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyCourses()));
                                });
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: firstList(
                                      itemCurrentCategory.categoryImage
                                          .toString(),
                                      itemCurrentCategory.category.toString(),
                                      context)),
                            );
                          }),
                      Text(
                        'Popular Courses',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CarouselSlider.builder(
                          itemCount: listofData.data!.popularCourseList!.length,
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height / 1.9,
                            aspectRatio: 2,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: true,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: false,
                            enlargeFactor: 0.3,
                            // onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          ),
                          itemBuilder: (context, index, _) {
                            final itemCurrentPopular =
                                listofData.data!.popularCourseList![index];
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MyCourses()));
                                        },
                                        child: Container(
                                            height: 170.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      itemCurrentPopular
                                                          .courseImage
                                                          .toString())),
                                            )),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              56.h),
                                      ListTile(
                                        title: Text(
                                          itemCurrentPopular.course.toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColor.headingColor,
                                            fontSize: 16.0.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              itemCurrentPopular.price
                                                  .toString(),
                                              style: TextStyle(
                                                color: AppColor.priceTextColor,
                                                fontSize: 16.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll<
                                                              Color>(
                                                          AppColor
                                                              .primaryColor)),
                                              onPressed: () {},
                                              child: Text(
                                                "Enroll",
                                                style: TextStyle(
                                                  color:
                                                      AppColor.primaryTextColor,
                                                  fontSize: 16.0.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15.h),
                                    ],
                                  ),
                                ));
                          }),
                      const SizedBox(height: 20),
                      Text(
                        'Featured Courses',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CarouselSlider.builder(
                          itemCount:
                              listofData.data!.featuredCourseList!.length,
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height / 1.9,
                            aspectRatio: 2,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: true,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: false,
                            enlargeFactor: 0.3,
                            // onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          ),
                          itemBuilder: (context, index, _) {
                            final itemCurrentFeaturedCourses =
                                listofData.data!.popularCourseList![index];
                            // final priceType =itemCurrentFeaturedCourses.priceType;/
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: 170.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    itemCurrentFeaturedCourses
                                                        .courseImage
                                                        .toString())),
                                          )),
                                      const SizedBox(height: 10),
                                      Column(
                                        children: <Widget>[
                                          ListTile(
                                            title: Text(
                                              itemCurrentFeaturedCourses.course
                                                  .toString(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColor.headingColor,
                                                fontSize: 16.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  itemCurrentFeaturedCourses
                                                      .price
                                                      .toString(),
                                                  style: TextStyle(
                                                    color:
                                                        AppColor.priceTextColor,
                                                    fontSize: 16.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll<
                                                                  Color>(
                                                              AppColor
                                                                  .primaryColor)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Enroll",
                                                    style: TextStyle(
                                                      color: AppColor
                                                          .primaryTextColor,
                                                      fontSize: 16.0.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 15.h),
                                    ],
                                  ),
                                ));
                          }),
                    ],
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
