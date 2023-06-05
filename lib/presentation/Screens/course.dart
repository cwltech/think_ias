import 'package:flutter/material.dart';

import 'detailpage.dart';
import 'drawer.dart';
import 'homepage.dart';

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 100,
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(
                  horizontal: 15,
                )),
                const SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: SizedBox(
                //     height: 60,
                //     width: 500,
                //     child: TextField(
                //       controller: _textController,
                //       decoration: InputDecoration(
                //           prefixIcon: Icon(Icons.search),
                //           suffix: IconButton(
                //             padding: EdgeInsets.all(0),
                //             iconSize: 20,
                //             onPressed: () {
                //               _textController.clear();
                //             },
                //             icon: Icon(Icons.clear),
                //           ),
                //           hintText: 'Search Here...',
                //           focusedBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10)),
                //           enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.grey.shade600))),
                //     ),
                //   ),
                // ),

                // Container(
                //   padding: const EdgeInsets.only(right: 220),
                //   child: const Text(
                //     'Our Courses',
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    Text(
                      'Our Courses',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: (1 / 1.4),
                    padding: const EdgeInsets.all(2),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    // 2 columns in each row
                    children: List.generate(category.length, (i) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetailPage()));
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(6.0),
                          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "images/two${i + 1}.png",
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  category[i],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                alignment: Alignment.center,
                                child: Text(
                                  heading[i],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
