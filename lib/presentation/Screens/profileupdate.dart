import 'package:flutter/material.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
              width: 95, child: Image.asset('assets/images/thinkiaslogo.png')),
          elevation: 0,
          actions: const [
            // IconButton(
            //   padding: const EdgeInsets.only(right: 10),
            //   icon: const Icon(Icons.search),
            //   onPressed: () {},
            // ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   padding: const EdgeInsets.only(top: 70),
            //   height: 200,
            //   width: 200,
            //   child: Image.asset('assets/images/thinkiaslogo.png'),
            // ),
            const SizedBox(
              height: 20,
            ),

            const CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                'https://www.pngitem.com/pimgs/m/264-2640465_passport-size-photo-sample-hd-png-download.png',
              ),
            ),
            // Container(
            //   child: Image.network(
            //     'https://jamesgilberdphotography.weebly.com/uploads/1/3/6/5/13650410/emma-not-smiling-35x45_1_orig.jpg',
            //     fit: BoxFit.cover,
            //   ),
            //   padding: const EdgeInsets.only(top: 70),
            //   height: 200,
            //   width: 200,
            //   decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            // ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                // height: MediaQuery.of(context).size.height + 5,
                alignment: Alignment.center,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           Text(
                      //             "Name                          :-       ",
                      //             style: TextStyle(fontSize: 18),
                      //           ),
                      //           Text('Manoj', style: TextStyle(fontSize: 18))
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           Text(
                      //             "Email                :- ",
                      //             style: TextStyle(fontSize: 18),
                      //           ),
                      //           Text('Ex@gmail.com', style: TextStyle(fontSize: 18))
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           Text(
                      //             "Mob.No                   :-       ",
                      //             style: TextStyle(fontSize: 18),
                      //           ),
                      //           Text('123456', style: TextStyle(fontSize: 18))
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           Text(
                      //             "Address          :-       ",
                      //             style: TextStyle(fontSize: 18),
                      //           ),
                      //           Text('pratap nagar', style: TextStyle(fontSize: 18))
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('Name'),
                      ),
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('email'),
                      ),
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('Mobile No.'),
                      ),
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('Address'),
                      ),

                      const SizedBox(height: 80),
                      InkWell(
                        onTap: () {
                          showAboutDialog(context: context, children: [
                            const Text(
                                'Your Information is Submitted sucessfully !')
                          ]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber),
                          child: Text(
                            "Submit",
                            style: mediumTextStyle(),
                          ),
                        ),
                      ),
                    ]))),
          ],
        )));
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
