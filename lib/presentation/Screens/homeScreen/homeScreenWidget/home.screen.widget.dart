// for category......

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget firstList(String imgVal, String text, BuildContext context) {
  return SizedBox(
    width: 80.0.w,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            foregroundColor: Colors.amber,
            backgroundColor: Colors.white,
            radius: 25.0.r,
            backgroundImage: NetworkImage(
              imgVal,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.0.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
