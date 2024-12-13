import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:hostel_app/auth/features/presentation/screens/onboarding_screen/widgets/login_button.dart';
import 'package:hostel_app/auth/features/presentation/screens/onboarding_screen/widgets/onboarding_scroll_page.dart';
import 'package:hostel_app/auth/features/presentation/screens/onboarding_screen/widgets/signup_button.dart';
import 'package:hostel_app/utils/constants/colors.dart';
import 'package:hostel_app/utils/constants/image_string.dart';
import 'package:hostel_app/utils/constants/text_string.dart';
import 'package:hostel_app/utils/device/device_utilities.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Scaffold(
        backgroundColor: dark ? ZohColors.darkerGrey : Colors.white,
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Stack(
              children: [
                PageView(
                  onPageChanged: (zoh) {
                    state.page = zoh;
                    BlocProvider.of<OnboardingBloc>(context).add(
                        OnboardingEvent());
                  },
                  children: const [
                    OnBoardingScrollPage(
                      image: ZohImageString.onBoarding1,
                      title: ZohTextString.onBoardingTitle1,
                      subTitle: ZohTextString.onBoardingSubTitle1,
                    ),
                    OnBoardingScrollPage(
                      image: ZohImageString.onBoarding2,
                      title: ZohTextString.onBoardingTitle2,
                      subTitle: ZohTextString.onBoardingSubTitle2,
                    ),
                    OnBoardingScrollPage(
                      image: ZohImageString.onBoarding3,
                      title: ZohTextString.onBoardingTitle3,
                      subTitle: ZohTextString.onBoardingSubTitle3,
                    ),
                  ],
                ),

                /// Dots Indicator
                Positioned(
                  bottom: ZohDeviceUtils.getAppBarHeight() * 3.8,
                  width: ZohDeviceUtils.getScreenWidth(Get.context!),
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: state.page,
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: ZohColors.primaryColor,
                      spacing: const EdgeInsets.all(4),
                      size: const Size.square(9.0),
                      activeSize: const Size(30.0, 10.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                /// SignUp
                const SignUpButton(),

                /// Login
                const LoginButton()
              ],
            );
          },
        ),
      ),
    );
  }
}


