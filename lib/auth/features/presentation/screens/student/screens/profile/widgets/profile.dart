import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/api_services/api_utils.dart';
import 'package:hostel_app/auth/features/presentation/screens/login_screen/login_screen.dart';
import 'package:hostel_app/utils/constants/image_string.dart';
import 'package:hostel_app/utils/device/device_utilities.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZohColors.darkerGrey : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: dark ? Colors.white : Colors.black,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.defaultSpace),
          child: ApiUtils.roleId == 1
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: const AssetImage(ZohImageString.user),
                        height: ZohDeviceUtils.getScreenHeight() * .25,
                      ),
                    ),
                    const SizedBox(
                      height: ZohSizes.md,
                    ),
                    const Text(
                      "You are an Admin",
                      style: TextStyle(
                        fontFamily: 'IBM_Plex_Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: ZohSizes.defaultSpace,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Image(
                      image: const AssetImage(ZohImageString.user),
                      height: ZohDeviceUtils.getScreenHeight() * .25,
                    ),
                    const SizedBox(
                      height: ZohSizes.md,
                    ),
                    Text(
                      "${ApiUtils.firstName} ${ApiUtils.lastName}",
                      style: const TextStyle(
                        fontFamily: 'IBM_Plex_Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: ZohSizes.defaultSpace,
                      ),
                    ),
                    const SizedBox(
                      height: ZohSizes.md,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    color: ZohColors.primaryColor, width: 3),
                              ),
                              color: dark ? Colors.black26 : Colors.black12,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(ZohSizes.sm),
                              child: Text(
                                'Room No - ${ApiUtils.roomNumber}',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: dark ? Colors.white54 : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: ZohSizes.sm,
                        ),
                        Expanded(
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    color: ZohColors.primaryColor, width: 3),
                              ),
                              color: dark ? Colors.black26 : Colors.black12,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(ZohSizes.sm),
                              child: Text(
                                'Block No - ${ApiUtils.blockNumber}',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: dark ? Colors.white54 : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: ZohSizes.iconXs,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: ZohColors.primaryColor, width: 3),
                        ),
                        color: dark ? Colors.black26 : Colors.black12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(ZohSizes.sm),
                        child: Text(
                          ApiUtils.email,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: dark ? Colors.white54 : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: ZohSizes.iconXs,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: ZohColors.primaryColor, width: 3),
                        ),
                        color: dark ? Colors.black26 : Colors.black12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(ZohSizes.sm),
                        child: Text(
                          ApiUtils.userName,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: dark ? Colors.white54 : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: ZohSizes.iconXs,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: ZohColors.primaryColor, width: 3),
                        ),
                        color: dark ? Colors.black26 : Colors.black12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(ZohSizes.sm),
                        child: Text(
                          ApiUtils.phoneNumber,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: dark ? Colors.white54 : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: ZohSizes.iconXs,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    color: ZohColors.primaryColor, width: 3),
                              ),
                              color: dark ? Colors.black26 : Colors.black12,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(ZohSizes.sm),
                              child: Text(
                                ApiUtils.firstName,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: dark ? Colors.white54 : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: ZohSizes.sm,
                        ),
                        Expanded(
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    color: ZohColors.primaryColor, width: 3),
                              ),
                              color: dark ? Colors.black26 : Colors.black12,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(ZohSizes.sm),
                              child: Text(
                                ApiUtils.lastName,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: dark ? Colors.white54 : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
