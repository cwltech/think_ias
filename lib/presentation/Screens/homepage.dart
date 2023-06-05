import 'package:flutter/material.dart';

import 'course.dart';
import 'dashboard.dart';
import 'homeScreen/home.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _pages = [
    const UserHome(),
    const UserDashboard(),
    const MyCourses(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedindex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20,
              color: Color.fromARGB(255, 5, 2, 89),
            ),
            label: 'Home',
            // backgroundColor: Color.fromARGB(255, 5, 2, 89)
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard_outlined,
              size: 20,
              color: Color.fromARGB(255, 5, 2, 89),
            ),
            label: 'DashBoard',
            // backgroundColor: Color.fromARGB(255, 5, 2, 89)
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cast_for_education_rounded,
              size: 20,
              color: Color.fromARGB(255, 5, 2, 89),
            ),
            label: 'Courses',
            // backgroundColor: Color.fromARGB(255, 5, 2, 89)
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              size: 20,
              color: Color.fromARGB(255, 5, 2, 89),
            ),
            label: 'Profile',
            // backgroundColor: Color.fromARGB(255, 5, 2, 89)
          )
        ],
      ),
    );
  }
}
