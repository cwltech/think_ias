import 'package:flutter/material.dart';

import 'homepage.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                padding: const EdgeInsets.only(top: 70),
                height: 200,
                width: 200,
                child: Image.asset('assets/images/thinkiaslogo.png')),
            Container(
                padding: const EdgeInsets.only(top: 50),
                // height: MediaQuery.of(context).size.height + 5,
                alignment: Alignment.center,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('Email'),
                      ),
                      TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration('Password'),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: const Text('Forgot Password?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
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
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have account?',
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
                                      builder: (context) => const SignUp()));
                            },
                            child: const Text(
                              'Register now',
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
  return const TextStyle(
    color: Colors.black,
    fontSize: 17,
  );
}
