import 'package:flutter/material.dart';
import 'package:hostel_app/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class OnBoardingScrollPage extends StatefulWidget {
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
  State<OnBoardingScrollPage> createState() => _OnBoardingScrollPageState();
}

class _OnBoardingScrollPageState extends State<OnBoardingScrollPage> {
  bool shimmer = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      shimmer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: ZohSizes.spaceBtwSections,
          horizontal: ZohSizes.spaceBtwItems),
      child: shimmer
          ? Shimmer.fromColors(
              baseColor: dark ? ZohColors.darkGrey : Colors.white,
              highlightColor: Colors.transparent,
              enabled: true,
              child: Column(
                children: [
                  Image(
                    image: AssetImage(widget.image),
                    width: ZohHelperFunction.screenWidth() * .7,
                    height: ZohHelperFunction.screenHeight() * .45,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 28, fontFamily: 'IBM_Plex_Sans'),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: ZohSizes.spaceBtwItems,
                  ),
                  Text(
                    widget.subTitle,
                    style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          : Column(
              children: [
                Image(
                  image: AssetImage(widget.image),
                  width: ZohHelperFunction.screenWidth() * .7,
                  height: ZohHelperFunction.screenHeight() * .45,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 28, fontFamily: 'IBM_Plex_Sans'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: ZohSizes.spaceBtwItems,
                ),
                Text(
                  widget.subTitle,
                  style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  textAlign: TextAlign.center,
                )
              ],
            ),
    );
  }
}
