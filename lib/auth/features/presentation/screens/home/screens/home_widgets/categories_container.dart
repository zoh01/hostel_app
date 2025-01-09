import 'package:flutter/material.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/device/device_utilities.dart';

class CategoriesContainer extends StatefulWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const CategoriesContainer({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  State<CategoriesContainer> createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
  bool ola = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      ola = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ola ? Shimmer.fromColors(
              baseColor: dark ? Colors.grey : Colors.white,
              highlightColor: Colors.transparent,
              enabled: ola,
              child: Container(
                padding: const EdgeInsets.all(ZohSizes.md),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: dark ? ZohColors.black : ZohColors.darkGrey,
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 3,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: dark ? ZohColors.darkerGrey : ZohColors.grey,
                        offset: const Offset(-2.0, -2.0),
                        blurRadius: 3,
                        spreadRadius: 1.0),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: dark ? ZohColors.darkGrey : Colors.white70
                ),
                child: Column(
                  children: [
                    Image(
                        image: AssetImage(widget.image),
                        width: ZohDeviceUtils.getScreenWidth(context) * .15),
                    const SizedBox(
                      height: ZohSizes.sm,
                    ),
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ) : Container(
              padding: const EdgeInsets.all(ZohSizes.md),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: dark ? ZohColors.black : ZohColors.darkGrey,
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 3,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: dark ? ZohColors.darkerGrey : ZohColors.grey,
                        offset: const Offset(-2.0, -2.0),
                        blurRadius: 3,
                        spreadRadius: 1.0),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: dark ? ZohColors.darkGrey : Colors.white70
              ),
              child: Column(
                children: [
                  Image(
                      image: AssetImage(widget.image),
                      width: ZohDeviceUtils.getScreenWidth(context) * .15),
                  const SizedBox(
                    height: ZohSizes.sm,
                  ),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
