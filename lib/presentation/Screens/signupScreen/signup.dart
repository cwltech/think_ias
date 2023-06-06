import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:think_ias/app/constant/constant.color.dart';
import 'package:think_ias/core/Provider/authentication.provider.dart';
import 'package:think_ias/presentation/Widgets/custom.text.field.dart';

import '../../Widgets/custom.logo.widget.dart';
import '../loginScreen/login.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider(bool renderUI) =>
        Provider.of<AuthenticationProvider>(context, listen: renderUI);
    _createAccount() {
      if (_formKey.currentState!.validate()) {
        authenticationProvider(false).createAccountProvider(
            userName: userNameController.text,
            userEmail: userEmailController.text,
            userPhoneNumber: phoneNumberController.text,
            context: context,
            userPassword: userPassController.text);
      }
    }

    return SafeArea(
      child: Scaffold(body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 15.h),
            customLogoWidget(context),
            SizedBox(height: MediaQuery.of(context).size.height / 25.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                              textInputType: TextInputType.name,
                              textEditingController: userNameController,
                              hintText: "Name",
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter an Username' : null),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                              textInputType: TextInputType.emailAddress,
                              textEditingController: userEmailController,
                              hintText: "Email",
                              validator: (val) =>
                                  !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                          .hasMatch(val!)
                                      ? 'Enter an email'
                                      : null),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                              textInputType: TextInputType.phone,
                              textEditingController: phoneNumberController,
                              maxLength: 10,
                              validator: (value) {
                                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = RegExp(pattern);
                                if (value?.length == 0) {
                                  return 'Please Enter Number';
                                } else if (!regExp.hasMatch(value!)) {
                                  return 'Please Enter Valid Number';
                                }
                                return null;
                              },
                              hintText: "Phone No"),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                              textInputType: TextInputType.visiblePassword,
                              textEditingController: userPassController,
                              hintText: "Password",
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter an Password' : null),
                        ),
                      ],
                    ))
              ],
            ),

            // Already Have A Account Section
            SizedBox(height: 25.h),
            MaterialButton(
                onPressed: () async {
                  _createAccount();
                },
                height: MediaQuery.of(context).size.height * 0.05,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: AppColor.primaryColor,
                child: Text(
                  "Save & Continue",
                  style: TextStyle(color: AppColor.headingColor),
                )),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have an account?',
                  style: mediumTextStyle(),
                ),
                SizedBox(width: 10.w),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Login Now',
                    style: TextStyle(
                        color: AppColor.priceTextColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ));
      })),
    );
  }
}

TextStyle simpleTextFieldStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
  );
}
