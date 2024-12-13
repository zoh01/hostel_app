import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/issues_screen/widgets/issue.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/issues_screen/widgets/issue_container.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class IssueScreen extends StatelessWidget {
  IssueScreen({super.key});

  List<Issue> studentIssue = [
    Issue('Adebayo Wariz', 'warizoh', '103', 'adebayozoh@gmail.com', '07025136608', 'Bathroom', 'Bathroom tap is not working', () {}),
    Issue('Adebayo Olamide', 'zoh', '201', 'adebayowarizoh@gmail.com', '07082390674', 'Kitchen', 'Kitchen cabinet is leaking', () {}),
    Issue('Adebayo Zoh', 'zoh Money', '202', 'zohmoney@gmail.com', '08163133077', 'Bedroom', 'Bedroom ceiling is leaking', () {}),
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
          'Student Issues',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: studentIssue.length,
        itemBuilder: _buildIssuesContainer,
      ),
    );
  }

  Widget _buildIssuesContainer(BuildContext context, int index) {
    Issue zoh = studentIssue[index];
    return IssuesContainer(
      name: zoh.name,
      userName: zoh.userName,
      roomNo: zoh.roomNo,
      email: zoh.email,
      phoneNo: zoh.phoneNo,
      issue: zoh.issue,
      comment: zoh.comment,
      onTap: zoh.onTap,
    );
  }
}
