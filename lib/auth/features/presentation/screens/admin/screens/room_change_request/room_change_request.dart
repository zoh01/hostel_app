import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/api_services/api_utils.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/room_change_request/widgets/room_change_container.dart';
import 'package:hostel_app/models/room_change_model.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../api_services/api_provider.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class RoomChangeRequests extends StatefulWidget {
  const RoomChangeRequests({super.key});

  @override
  State<RoomChangeRequests> createState() => _RoomChangeRequestsState();
}

class _RoomChangeRequestsState extends State<RoomChangeRequests> {
  RoomChangeModel? roomChangeModel;

  Future<void> fetchRoomChangeRequest() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);

      final roomInfo =
          await apiProvider.getResponse(ApiUtils.roomChangeRequest);

      if (roomInfo.statusCode == 200) {
        final Map<String, dynamic> change = json.decode(roomInfo.body);

        roomChangeModel = RoomChangeModel.fromJson(change);
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
          'Room Change Request',
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
              future: fetchRoomChangeRequest(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return roomChangeModel == null
                      ? const Center(
                          child: Text('No Staff found'),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: roomChangeModel!.result.length,
                          itemBuilder: (context, index) {
                            return RoomChangeContainer(
                              roomInfo: roomChangeModel!.result[index],
                            );
                          });
                }
              },
            ),
    );
  }

// Widget _buildRoomChangeContainer(BuildContext context, int index) {
//   RoomChange zoh = changeRequest[index];
//   return RoomChangeContainer(
//     name: zoh.name,
//     userName: zoh.userName,
//     currentRoom: zoh.currentRoom,
//     currentBlock: zoh.currentBlock,
//     email: zoh.email,
//     phoneNo: zoh.phoneNo,
//     block: zoh.block,
//     room: zoh.room,
//     reason: zoh.reason,
//     reject: zoh.reject,
//     approve: zoh.approve,
//   );
// }
}
