import 'package:flutter/material.dart';
import 'package:think_ias/presentation/Screens/profileScreen/profileScreenWidget/profile.screen.widget.dart';

import 'drawer.dart';
import 'homepage.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            width: 95, child: Image.asset('assets/images/thinkiaslogo.png')),
        elevation: 0,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 8),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const HomePage())));
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Container(
            // color: Colors.redAccent,
            height: constraints.maxHeight,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/264-2640465_passport-size-photo-sample-hd-png-download.png'))),
                const SizedBox(height: 20),
                profileScreenDetailWidget("Name", "Vivek")
              ],
            )),
          );
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)));
}

TextStyle simpleTextFieldStyle() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 16,
  );
}

TextStyle mediumTextStyle() {
  return const TextStyle(color: Colors.black, fontSize: 17);
}
