import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/issues_screen/widgets/issue_container.dart';
import 'package:hostel_app/models/issue_model.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../api_services/api_provider.dart';
import '../../../../../../../api_services/api_utils.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen({super.key});

  @override
  State<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {

  IssueModel? issueModel;

  Future<void> fetchStudentIssues() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);

      final issues =
      await apiProvider.getResponse(ApiUtils.studentIssues);

      if (issues.statusCode == 200) {
        final Map<String, dynamic> issue = json.decode(issues.body);

        issueModel = IssueModel.fromJson(issue);
      }
    } catch (e) {
      print('error $e');
    }
  }

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
      body: FutureBuilder(
        future: fetchStudentIssues(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return issueModel == null
                ? const Center(
              child: Text('No Issues found'),
            )
                : ListView.builder(
                shrinkWrap: true,
                itemCount: issueModel!.result.length,
                itemBuilder: (context, index) {
                  return IssuesContainer(issue: issueModel!.result[index],);
                });
          }
        },
      ),
    );
  }
}
