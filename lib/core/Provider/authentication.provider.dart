import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:think_ias/core/api/authentication.api.dart';

import '../../app/constant/app.key.dart';
import '../../app/routes/app.routes.dart';
import '../utils/snackbar.util.dart';

class AuthenticationProvider with ChangeNotifier {
  final AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  // ** Create Account Provider Function
  Future createAccountProvider(
      {required String userName,
      required String userEmail,
      required String userPhoneNumber,
      required BuildContext context,
      required String userPassword}) async {
    try {
      print(
          "Usernmae : $userName ... Email: $userEmail // password: $userPassword ... UserPhone: $userPhoneNumber");

      var userCreateData = await _authenticationAPI.createAccount(
          userName: userName,
          userEmail: userEmail,
          userPhoneNumber: userPhoneNumber,
          userPassword: userPassword);
      print("Provider User Data(JSON) =====> $userCreateData");
      final Map<String, dynamic> parseData = await jsonDecode(userCreateData);
      print("Parse Value(JSON) =========> $parseData");

      /*Parse(Value) the in Integer */
      int statusInfo = int.parse(parseData['status']);
      //*To Check The Which Type Of Value"String or Integer is This */
      print(
          "Check Value type ==================>${parseData['status'].runtimeType}");
      if (statusInfo == 1) {
        var userID = parseData["data"]["user_id"];
        print("Create User ID =====> $userID");
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences
            .setString(AppKeys.userLoginKey, userID.toString())
            .whenComplete(() => Navigator.of(context)
                .pushReplacementNamed(AppRouter.homeRoute));
      } else {
        print("Else Printed");
        ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
            text: "User already exist", context: context));
      }
    } catch (e) {
      print(e);
    }
  }

//  Login User Provider

  loginUserProvider(
      {required String userEmail,
      required String userPassword,
      required BuildContext context}) async {
    try {
      var userLoginData = await _authenticationAPI.loginAccount(
          userEmail: userEmail, userPassword: userPassword);
      final Map<String, dynamic> parseLoginData =
          await jsonDecode(userLoginData);
      int statusInfo = int.parse(parseLoginData['status']);

      print("User Login Parse Data =========> $parseLoginData");
      if (statusInfo == 1) {
        var userLogInID = parseLoginData["data"]["user_id"];
        print("Login User ID =====> $userLogInID");
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences
            .setString(AppKeys.userLoginKey, userLogInID)
            .whenComplete(() {
          ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
              text: "Login Successfully", context: context));
          Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute);
        });
      } else {
        print("Else Printed");
        ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
            text: "User Not Match", context: context));
      }
    } catch (e) {
      print(e);
    }
  }
}
