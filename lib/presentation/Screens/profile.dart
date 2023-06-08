import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:think_ias/app/constant/constant.color.dart';
import 'package:think_ias/presentation/Screens/profileScreen/profileScreenWidget/profile.screen.widget.dart';

import 'drawer.dart';
import 'homepage.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // XFile? _imageFile;
  //
  // Future<void> selectFileFromDevice() async {
  //   XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (file != null) {
  //     setState(() {
  //       _imageFile = XFile(file.path);
  //     });
  //   }
  // }

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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: constraints.maxHeight,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Center(
                    child: PhysicalModel(
                      shape: BoxShape.circle,
                      color: AppColor.primaryColor,
                      elevation: 15,
                      child: CircleAvatar(
                        radius: 45.r,
                        backgroundImage: const NetworkImage(
                            'https://www.pngitem.com/pimgs/m/264-2640465_passport-size-photo-sample-hd-png-download.png'),
                        child: Stack(children: <Widget>[
                          Positioned(
                              left: 55,
                              top: 60.1,
                              child: CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: Colors.white,
                                  child: InkWell(
                                    onTap: () {
                                      //TODO : Check For Image Upload
                                      // selectFileFromDevice();
                                      print("Upload Image");
                                    },
                                    child: Icon(
                                      Icons.camera,
                                      color: AppColor.primaryColor,
                                    ),
                                  )))
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  profileScreenDetailWidget("Name", "Vivek")
                ],
              )),
            ),
          );
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
