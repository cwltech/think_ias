import 'package:flutter/material.dart';

import 'drawer.dart';
import 'homepage.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final _textController = TextEditingController();
  List<String> recommand = [
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
  ];
  List<String> heading1 = [
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
    "Economy Course",
  ];
  List<String> price = [
    "RS. 1000",
    "RS. 1000",
    "RS. 1000",
    "RS. 1000",
    "RS. 1000",
    "RS. 1000",
    "RS. 1000",
    "RS. 1000",
    "RS. 1000",
    "RS. 1000",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Dash Board ',
        ),
        actions: [
          // IconButton(
          //   padding: const EdgeInsets.only(right: 2),
          //   icon: const Icon(Icons.notifications),
          //   onPressed: () {},
          // ),
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
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height + 540,
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 45,
                      width: 500,
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffix: IconButton(
                              padding: const EdgeInsets.all(0),
                              iconSize: 20,
                              onPressed: () {
                                _textController.clear();
                              },
                              icon: const Icon(Icons.clear),
                            ),
                            hintText: 'Search Here...',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: const [
                      Text(
                        'Featured Courses',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.only(right: 170),
                  //   child: const Text(
                  //     'Featured Courses',
                  //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: (1 / 1.3),
                      padding: const EdgeInsets.all(2),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2, // 2 columns in each row
                      children: List.generate(price.length, (i) {
                        return Container(
                          margin: const EdgeInsets.all(6.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "images/one${i + 1}.png",
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      recommand[i],
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        price[i],
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  heading1[i],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
