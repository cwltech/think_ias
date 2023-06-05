// for category......

import 'package:flutter/material.dart';

Widget firstlist(String imgVal, String text) {
  return SizedBox(
    width: 80.0,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            foregroundColor: Colors.amber,
            backgroundColor: Colors.white,
            radius: 25.0,
            backgroundImage: AssetImage(
              imgVal,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
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
