import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';


class OnBoardingScrollPage extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const OnBoardingScrollPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {

    final dark = ZohHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: ZohSizes.spaceBtwSections,
          horizontal: ZohSizes.spaceBtwItems),
      child: Column(
        children: [
          Image(image: AssetImage(image), width: ZohHelperFunction.screenWidth() * .7, height: ZohHelperFunction.screenHeight() * .45,),
          Text(title, style: const TextStyle(fontSize: 28, fontFamily: 'IBM_Plex_Sans'), textAlign: TextAlign.center,),
          const SizedBox(height: ZohSizes.spaceBtwItems,),
          Text(subTitle, style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}