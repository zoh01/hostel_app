import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/issues_screen/issue_screen.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/room_change_request/room_change_request.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/staff_members/staff_members.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/hostel_fee/hostel_fee.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/profile/widgets/profile.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/room_available/room_available.dart';
import 'package:hostel_app/models/student_info_model.dart';
import 'package:hostel_app/utils/constants/image_string.dart';
import 'package:hostel_app/utils/constants/sizes.dart';
import 'package:hostel_app/utils/constants/text_string.dart';
import 'package:hostel_app/utils/device/device_utilities.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../api_services/api_provider.dart';
import '../../../../../../api_services/api_utils.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../admin/screens/create_staff/create_staff.dart';
import 'home_widgets/categories_container.dart';
import 'home_widgets/info_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StudentInfoModel? studentInfoModel;

  Future<void> fetchStudentData(String emailId) async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);

      final studentInfo =
          await apiProvider.getResponse('${ApiUtils.studentInfo}$emailId');

      if (studentInfo.statusCode == 200) {
        final Map<String, dynamic> student = json.decode(studentInfo.body);

        studentInfoModel = StudentInfoModel.fromJson(student);
      }
    } catch (e) {
      print('error $e');
    }
  }

  @override
  void initState() {
    fetchStudentData(ApiUtils.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZohColors.darkerGrey : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: Image(
                image: const AssetImage(ZohImageString.user),
                width: ZohDeviceUtils.getScreenWidth(context) * .11,
              ),
            ),
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
                              builder: (context) => const RoomAvailable(),
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
                              builder: (context) => const IssueScreen(),
                            ),
                          );
                        },
                        image: ZohImageString.document,
                        title: ZohTextString.allIssues,
                      ),
                      CategoriesContainer(
                        onTap: () {
                          final zoh = studentInfoModel!.result.first;
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => HostelFee(
                                blockNumber: zoh.studentProfileData.block,
                                roomNumber: zoh.studentProfileData.roomNumber
                                    .toString(),
                                maintenanceCharge: zoh
                                    .roomChargesModel.maintenanceCharges
                                    .toString(),
                                parkingCharge: zoh
                                    .roomChargesModel.parkingCharges
                                    .toString(),
                                waterCharge: zoh
                                    .roomChargesModel.roomWaterCharges
                                    .toString(),
                                roomCharge:
                                    zoh.roomChargesModel.roomAmount.toString(),
                                totalCharge:
                                    zoh.roomChargesModel.totalAmount.toString(),
                              ),
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
                              builder: (context) => const StaffMembers(),
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
                              builder: (context) => const RoomChangeRequests(),
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
