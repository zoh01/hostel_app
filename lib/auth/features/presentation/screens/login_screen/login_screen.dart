import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/auth/features/presentation/screens/login_screen/widgets/login_form.dart';
import 'package:hostel_app/auth/features/presentation/screens/sign_up_screen/signup_screen.dart';
import 'package:hostel_app/utils/constants/colors.dart';
import 'package:hostel_app/utils/constants/image_string.dart';
import 'package:hostel_app/utils/constants/sizes.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/text_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZohColors.darkerGrey : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ZohSizes.defaultSpace),
            child: Column(
              children: [
                Image(
                  image: const AssetImage(ZohImageString.appHome),
                  width: ZohHelperFunction.screenWidth() * .3,
                ),
                const SizedBox(
                  height: ZohSizes.md,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ZohTextString.loginTitle,
                      style: TextStyle(
                          fontFamily: 'IBM_Plex_Sans',
                          fontWeight: FontWeight.bold,
                          color: dark ? Colors.white : Colors.black,
                          fontSize: ZohSizes.spaceBtwSections),
                    ),
                    const SizedBox(
                      height: ZohSizes.sm,
                    ),
                    const Text(
                      ZohTextString.loginSubTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ZohSizes.spaceBtwSections),

                /// LoginForm
                const LoginForm(),

                const SizedBox(height: ZohSizes.spaceBtwSections),

                /// Sign Up Text Button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(ZohHelperFunction.screenWidth(), 60),
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Colors.transparent),
                    overlayColor: ZohColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    ZohTextString.signupTitle,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: dark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
