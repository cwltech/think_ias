import 'package:flutter/material.dart';
import 'package:think_ias/app/constant/constant.color.dart';

class SnackUtil {
  static stylishSnackBar(
      {required String text, required BuildContext context}) {
    return SnackBar(
      backgroundColor: AppColor.primaryColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 100),
      content: Text(
        text,
        style: TextStyle(
          color: AppColor.primaryTextColor,
          fontFamily: "poppins",
        ),
      ),
    );
  }
}
