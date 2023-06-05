// for category......

import 'package:flutter/material.dart';

Widget profileScreenDetailWidget(String title, String infoText) {
  return SizedBox(
    width: 80.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
        const SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
