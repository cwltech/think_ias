import 'package:flutter/material.dart';

import '../../app/constant/constant.color.dart';

class CustomTextField {
  static customTextField(
      {required TextEditingController textEditingController,
      required String hintText,
      int? maxLength,
      TextInputType? textInputType,
      String? Function(String?)? validator,
      Function(String)? onChanged}) {
    return TextFormField(
      keyboardType: textInputType,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: "poppins",
      ),
      onChanged: onChanged,
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.headingColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
