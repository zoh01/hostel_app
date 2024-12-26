import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/api_services/api_calls.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/staff_members/widgets/staff_container.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../api_services/api_provider.dart';
import '../../../../../../../api_services/api_utils.dart';
import '../../../../../../../models/staff_info_model.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class StaffMembers extends StatefulWidget {
  const StaffMembers({super.key});

  @override
  State<StaffMembers> createState() => _StaffMembersState();
}

class _StaffMembersState extends State<StaffMembers> {
  StaffInfoModel? staffInfoModel;

  Future<void> fetchAllStaff() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);

      final staffInfo = await apiProvider.getResponse(ApiUtils.allStaff);

      if (staffInfo.statusCode == 200) {
        final Map<String, dynamic> staff = json.decode(staffInfo.body);

        staffInfoModel = StaffInfoModel.fromJson(staff);
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
          'Hostel Staffs',
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
          : FutureBuilder(
              future: fetchAllStaff(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return staffInfoModel == null
                      ? const Center(
                          child: Text('No Staff found'),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: staffInfoModel!.result.length,
                          itemBuilder: (context, index) {
                            return StaffContainer(
                              staff: staffInfoModel!.result[index],
                            );
                          });
                }
              },
            ),
    );
  }
}
