import 'package:flutter/cupertino.dart';

Widget customLogoWidget(BuildContext context) {
  return Column(children: <Widget>[
    Container(
        height: 100,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/thinkiaslogo.png')))),
    SizedBox(height: MediaQuery.of(context).size.height / 15)
  ]);
}
