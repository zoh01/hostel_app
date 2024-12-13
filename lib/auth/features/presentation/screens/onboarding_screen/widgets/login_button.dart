import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/utils/constants/text_string.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utilities.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../login_screen/login_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);

    return Positioned(
      bottom: ZohDeviceUtils.getAppBarHeight() * .8,
      left: ZohSizes.defaultSpace,
      right: ZohSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const LoginScreen()));
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
    );
  }
}
