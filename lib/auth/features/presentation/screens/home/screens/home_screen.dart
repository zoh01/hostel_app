import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/issues_screen/issue_screen.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/room_change_request/room_change_request.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/staff_members/staff_members.dart';
import 'package:hostel_app/auth/features/presentation/screens/login_screen/login_screen.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/hostel_fee/hostel_fee.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/room_available/room_available.dart';
import 'package:hostel_app/utils/constants/image_string.dart';
import 'package:hostel_app/utils/constants/sizes.dart';
import 'package:hostel_app/utils/constants/text_string.dart';
import 'package:hostel_app/utils/device/device_utilities.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../admin/screens/create_staff/create_staff.dart';
import 'home_widgets/categories_container.dart';
import 'home_widgets/info_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZohColors.darkerGrey : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.logout,
            color: dark ? Colors.white : Colors.black,
          ),
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: ZohSizes.md),
            child: Image(
                image: const AssetImage(ZohImageString.user),
                width: ZohDeviceUtils.getScreenWidth(context) * .11),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.defaultSpace),
          child: Column(
            children: [
              /// Info Container
              const InfoContainer(),

              const SizedBox(
                height: ZohSizes.spaceBtwSections * 1.5,
              ),
              Column(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: ZohSizes.spaceBtwZoh,
                        color: dark ? Colors.white60 : Colors.black54),
                  ),
                  const SizedBox(
                    height: ZohSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoriesContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => RoomAvailable(),
                            ),
                          );
                        },
                        image: ZohImageString.availableRoom,
                        title: ZohTextString.roomAvailable,
                      ),
                      CategoriesContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => IssueScreen(),
                            ),
                          );
                        },
                        image: ZohImageString.document,
                        title: ZohTextString.allIssues,
                      ),
                      CategoriesContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const HostelFee(),
                            ),
                          );
                        },
                        image: ZohImageString.hostelFee,
                        title: ZohTextString.hostelFee,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: ZohSizes.defaultSpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoriesContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const CreateStaff(),
                            ),
                          );
                        },
                        image: ZohImageString.createStaff,
                        title: ZohTextString.createStaff,
                      ),
                      CategoriesContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => StaffMembers(),
                            ),
                          );
                        },
                        image: ZohImageString.staffMembers,
                        title: ZohTextString.staffMembers,
                      ),
                      CategoriesContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => RoomChangeRequest(),
                            ),
                          );
                        },
                        image: ZohImageString.changeRoom,
                        title: ZohTextString.changeRequest,
                      )
                    ],
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
