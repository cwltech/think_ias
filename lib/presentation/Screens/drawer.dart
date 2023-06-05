import 'package:flutter/material.dart';

import 'course.dart';
import 'feedback.dart';
import 'ncertpdfpage.dart';
import 'profile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // const imgurl = "https://cwltechnology.in/think-ias/img/general/logo.png";
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.

        children: [
          const SizedBox(
            height: 200,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  currentAccountPictureSize: Size.square(110),
                  margin: EdgeInsets.zero,
                  accountName: Text('User Name'),
                  accountEmail: Text('User@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://www.pngitem.com/pimgs/m/264-2640465_passport-size-photo-sample-hd-png-download.png',
                    ),
                  )),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: const Text('My Profile'),
            onTap: () {
              // Update the state of the app.
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserProfile()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text('My Study Material'),
            onTap: () {
              // Update the state of the app.
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyCourses()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text('NCERT'),
            onTap: () {
              // Update the state of the app.
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NcertPdfPage()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Resources'),
            onTap: () {
              // Update the state of the app.
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeedBackPage()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment_sharp),
            title: const Text('Payment History'),
            onTap: () {
              // Update the state of the app.
              // Navigator.pop(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const FeedBackPage()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('About Us'),
            onTap: () {
              // Update the state of the app.
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const MyCourses()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: const Text('Notification'),
            onTap: () {
              // Update the state of the app.
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const MyCourses()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share App'),
            onTap: () {
              // Update the state of the app.
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const MyCourses()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_border),
            title: const Text('Rate App'),
            onTap: () {
              // Update the state of the app.
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const MyCourses()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user_outlined),
            title: const Text('Term & Condition'),
            onTap: () {
              // Update the state of the app.
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const MyCourses()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.query_builder_outlined),
            title: const Text('Ask Query'),
            onTap: () {
              // Update the state of the app.
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const MyCourses()));
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Update the state of the app.
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const MyCourses()));
              // ...
            },
          ),
        ],
      ),
    );
  }
}
