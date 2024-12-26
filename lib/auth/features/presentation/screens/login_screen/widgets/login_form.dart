import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/api_services/api_calls.dart';
import 'package:hostel_app/auth/features/presentation/screens/home/screens/home_screen.dart';
import 'package:hostel_app/utils/constants/colors.dart';
import 'package:hostel_app/utils/constants/text_string.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isSecuredZoh = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _zohKey = GlobalKey<FormState>();

  ApiCall apiCall = ApiCall();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Form(
      key: _zohKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Email
          Text(
            'Email Address',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: dark ? Colors.white54 : Colors.black54),
          ),

          const SizedBox(
            height: ZohSizes.md,
          ),

          /// Email
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter your valid email';
              }
              return null;
            },
            cursorColor: dark ? Colors.white : Colors.black,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(
                  Icons.email,
                  color: dark ? Colors.white : Colors.black,
                ),
                fillColor: dark ? ZohColors.darkContainer : Colors.white54,
                hintText: 'Enter Email',
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: dark ? Colors.white : Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dark ? Colors.white : Colors.black,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0)))),
          ),

          const SizedBox(
            height: ZohSizes.spaceBtwSections,
          ),

          /// Password
          Text(
            'Password',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: dark ? Colors.white54 : Colors.black54),
          ),

          const SizedBox(
            height: ZohSizes.md,
          ),

          /// Password
          TextFormField(
            controller: passwordController,
            validator: (zoh) {
              if (zoh!.isEmpty) {
                return 'Enter your password';
              }
              return null;
            },
            cursorColor: dark ? Colors.white : Colors.black,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(
                  Icons.password,
                  color: dark ? Colors.white : Colors.black,
                ),
                suffixIcon: toggleZoh(),
                fillColor: dark ? ZohColors.darkContainer : Colors.white54,
                hintText: 'Enter Password',
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: dark ? Colors.white : Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dark ? Colors.white : Colors.black,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0)))),
            obscureText: _isSecuredZoh,
          ),

          const SizedBox(
            height: ZohSizes.spaceBtwSections,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_zohKey.currentState!.validate()) {
                  print('Validation');
                  apiCall.handleLogin(
                    context,
                    emailController.text,
                    passwordController.text,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ZohColors.primaryColor,
                  textStyle: const TextStyle(fontSize: 28),
                  minimumSize: const Size(0, 60),
                  side: const BorderSide(color: ZohColors.primaryColor),
                  elevation: 5),
              child: const Text(
                ZohTextString.login,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IBMPlexSans',
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget toggleZoh() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecuredZoh = !_isSecuredZoh;
          });
        },
        icon: _isSecuredZoh
            ? Icon(
                Icons.visibility_off,
                color: ZohHelperFunction.isDarkMode(context)
                    ? Colors.white
                    : Colors.black,
              )
            : Icon(
                Icons.visibility,
                color: ZohHelperFunction.isDarkMode(context)
                    ? Colors.white
                    : Colors.black,
              ));
  }
}
