import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:think_ias/core/Provider/authentication.provider.dart';
import 'package:think_ias/presentation/Widgets/custom.logo.widget.dart';

import '../../../app/constant/constant.color.dart';
import '../../Widgets/custom.text.field.dart';
import '../signupScreen/signup.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _userLogin() {
      if (_formKey.currentState!.validate()) {
        var authNotifier =
            Provider.of<AuthenticationProvider>(context, listen: false);
        authNotifier.loginUserProvider(
            userEmail: userEmailController.text,
            userPassword: userPasswordController.text,
            context: context);
      }
    }

    return SafeArea(
      child: Scaffold(body: SafeArea(
        child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
          return SingleChildScrollView(
              child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 15.h),
              customLogoWidget(context),
              SizedBox(height: MediaQuery.of(context).size.height / 25.h),
              Form(
                key: _formKey,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                    child: CustomTextField.customTextField(
                        textInputType: TextInputType.name,
                        textEditingController: userEmailController,
                        hintText: "Email",
                        validator: (val) =>
                            !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(val!)
                                ? 'Enter an email'
                                : null),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                    child: CustomTextField.customTextField(
                        textInputType: TextInputType.name,
                        textEditingController: userPasswordController,
                        hintText: "Password",
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an Password' : null),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: AppColor.priceTextColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  MaterialButton(
                      onPressed: () async {
                        _userLogin();
                      },
                      height: MediaQuery.of(context).size.height * 0.05,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: AppColor.primaryColor,
                      child: Text(
                        "Login",
                        style: TextStyle(color: AppColor.headingColor),
                      )),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account?',
                        style: mediumTextStyle(),
                      ),
                      SizedBox(width: 10.w),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                              color: AppColor.priceTextColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ));
        }),
      )),
    );
  }
}

TextStyle mediumTextStyle() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 17,
  );
}
