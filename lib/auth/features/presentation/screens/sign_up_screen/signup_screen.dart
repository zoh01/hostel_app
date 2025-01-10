import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/login_screen/login_screen.dart';
import 'package:hostel_app/auth/features/presentation/screens/sign_up_screen/widgets/signup_form.dart';
import 'package:hostel_app/utils/constants/sizes.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_string.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZohColors.darkerGrey : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: dark ? Colors.white70 : Colors.black54,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: ZohSizes.defaultSpace,
            left: ZohSizes.defaultSpace,
            right: ZohSizes.defaultSpace,
            bottom: ZohSizes.spaceBtwSections,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ZohTextString.signupTitle,
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
                    ZohTextString.singUpSubTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: ZohSizes.spaceBtwSections),

              /// SignUp Form
              const SignUpForm(),

              const SizedBox(
                height: ZohSizes.spaceBtwItems,
              ),

              /// Login Button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
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
                  ZohTextString.loginText,
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
    );
  }
}
