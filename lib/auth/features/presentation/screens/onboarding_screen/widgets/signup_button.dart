import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_string.dart';
import '../../../../../../utils/device/device_utilities.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../sign_up_screen/signup_screen.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: ZohDeviceUtils.getAppBarHeight() * 2.1,
      left: ZohSizes.defaultSpace,
      right: ZohSizes.defaultSpace,
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => const SignupScreen()));
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(ZohHelperFunction.screenWidth(), 60),
              backgroundColor: ZohColors.primaryColor,
              side: const BorderSide(color: ZohColors.primaryColor),
              elevation: 5),
          child: const Text(
            ZohTextString.createAccount,
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
