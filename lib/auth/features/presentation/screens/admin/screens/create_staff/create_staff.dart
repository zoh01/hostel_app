import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/api_services/api_provider.dart';
import 'package:hostel_app/api_services/api_utils.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/create_staff/widgets/staff_form.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class CreateStaff extends StatelessWidget {
  const CreateStaff({super.key});

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
            'Create Staff',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: ZohSizes.defaultSpace,
            ),
          ),
        ),
        body: ApiUtils.roleId != 1
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(ZohSizes.defaultSpace),
                  child: Text(
                    "Only the Admin have permission to view this screen...",
                    style: TextStyle(
                      fontFamily: 'IBM_Plex_Sans',
                      fontSize: ZohSizes.spaceBtwZoh,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(ZohSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Staff Form
                      StaffForm(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
