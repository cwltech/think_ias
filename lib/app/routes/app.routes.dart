import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_ias/presentation/Screens/homepage.dart';
import 'package:think_ias/presentation/Screens/loginScreen/login.dart';
import 'package:think_ias/presentation/Screens/signupScreen/signup.dart';
import 'package:think_ias/presentation/Screens/splashscreen.dart';

class AppRouter {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signup";
  static const String homeRoute = "/home";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
          );
        }
      case loginRoute:
        {
          return MaterialPageRoute(
            builder: (_) => LoginPage(),
          );
        }
      case signUpRoute:
        {
          return MaterialPageRoute(
            builder: (_) => SignUp(),
          );
        }
      case homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const HomePage(),
          );
        }
    }
  }
}
