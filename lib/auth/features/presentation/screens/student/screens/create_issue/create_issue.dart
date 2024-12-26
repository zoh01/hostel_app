import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/api_services/api_provider.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/create_issue/widgets/create_issue_form.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../api_services/api_utils.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class CreateIssue extends StatefulWidget {
  const CreateIssue({super.key});

  @override
  State<CreateIssue> createState() => _CreateIssueState();
}

class _CreateIssueState extends State<CreateIssue> {


  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(
            baseUrl: ApiUtils.baseUrl,
            httpClient: http.Client(),
          ),
        ),
      ],
      child: Scaffold(
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
            'Create Issue',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: ZohSizes.defaultSpace,
            ),
          ),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: ZohSizes.defaultSpace,
              left: ZohSizes.defaultSpace,
              right: ZohSizes.defaultSpace,
              bottom: ZohSizes.spaceBtwSections,
            ),
            child: CreateIssueForm(),
          ),
        ),
      ),
    );
  }
}
