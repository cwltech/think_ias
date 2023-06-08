import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/Provider/lists.providers.dart';
import '../drawer.dart';
import '../homeScreen/homeScreenWidget/home.screen.widget.dart';
import '../homepage.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  List<String> category = [
    "Economy Course",
    "Environment Modules for upsc",
    "Science and Technology Module",
    "Economy Course",
    "Environment Modules for upsc",
    "Science and Technology Module",
  ];

  List<String> heading = [
    "Complete Conceptual Clarity and Comprehensive Coverage of Economy.",
    "Comprehenive Coverage of both current and static syllabus",
    "National and international bodies ,indexes and reports",
    "Complete Conceptual Clarity and Comprehensive Coverage of Economy.",
    "Comprehenive Coverage of both current and static syllabus",
    "National and international bodies ,indexes and reports",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ListOfDataProvider>(context, listen: false);
      Provider.of<ListOfDataProvider>(context, listen: false)
          .fetchCategoryListData(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Most Popular Courses',
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Container(
          color: Colors.white,
          height: constraints.maxHeight.h,
          child: SingleChildScrollView(
            child: Consumer<ListOfDataProvider>(builder: (context, state, _) {
              final listCourseData = state.categoryListDatas;
              return Column(
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: const [
                      Text(
                        "",
                        // listCourseData.data,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      // listofData.data!.categoryList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        // final itemCurrentCategory =
                        // listofData.data!.categoryList![index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyCourses()));
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: firstList(
                                  " itemCurrentCategory.categoryImage.toString()",
                                  "itemCurrentCategory.category.toString()",
                                  context)),
                        );
                      }),
                ],
              );
            }),
          ),
        );
      }),
      drawer: const MyDrawer(),
    );
  }
}
