import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/utils/constants/image_string.dart';
import 'package:hostel_app/utils/constants/sizes.dart';
import 'package:hostel_app/utils/constants/text_string.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8)).then((zoh) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZohColors.darkGrey : Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: const AssetImage(
                    ZohImageString.appHome,
                  ),
                  height: ZohHelperFunction.screenHeight() * .8),
              SizedBox(
                child: DefaultTextStyle(
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'IBM_Plex_Sans',
                      fontSize: 20),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        ZohTextString.splashTitle,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
