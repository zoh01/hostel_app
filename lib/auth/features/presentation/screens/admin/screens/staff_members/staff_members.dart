import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/staff_members/widgets/details.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/staff_members/widgets/staff_container.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/device/device_utilities.dart';

class StaffMembers extends StatelessWidget {
  StaffMembers({super.key});

  List<Details> staffDetails = [
    Details('Hostel Chairman', 'Adebayo', 'Wariz', 'adebayozoh@gmail.com',
        '07025136608', () {}),
    Details('Assistant Chairman', 'Ayomide', 'Joymit',
        'ayomidejoymit@gmail.com', '07082390674', () {}),
    Details('Hostel Manager', 'Olamide', 'Warizoh', 'olamidewarizoh@gmail.com',
        '08163133077', () {})
  ];

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
          'Hostel Staffs',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: staffDetails.length,
        itemBuilder: _buildStaffDetails,
      ),
    );
  }

  Widget _buildStaffDetails(BuildContext context, int index) {
    Details details = staffDetails[index];
    return StaffContainer(
      title: details.title,
      firstName: details.firstName,
      lastName: details.lastName,
      email: details.email,
      phoneNo: details.phoneNo,
      onTap: details.onTap,
    );
  }
}
