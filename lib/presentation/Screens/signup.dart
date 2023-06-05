import 'package:flutter/material.dart';

import 'homepage.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: SizedBox(
          //     width: 95, child: Image.asset('assets/images/thinkiaslogo.png')),
          elevation: 0,
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 12),
              icon: const Icon(Icons.home_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomePage())));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50),
              height: 200,
              width: 200,
              child: Image.asset('assets/images/thinkiaslogo.png'),
            ),
            Container(
                padding: const EdgeInsets.only(top: 30),
                // height: MediaQuery.of(context).size.height + 5,
                alignment: Alignment.center,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('Name'),
                      ),
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('UserName'),
                      ),
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('Mobile No.'),
                      ),
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('Email Address'),
                      ),
                      const SizedBox(height: 16),
                      // Container(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 16, vertical: 8),
                      //     child: Text(
                      //       'Forgot Password?',
                      //       style: simpleTextFieldStyle(),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          showAboutDialog(context: context, children: [
                            const Text('Your Information sucessfully Updated !')
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
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.amber),
                          child: Text(
                            "Save & Continue",
                            style: mediumTextStyle(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            style: mediumTextStyle(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              'Login now',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
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
